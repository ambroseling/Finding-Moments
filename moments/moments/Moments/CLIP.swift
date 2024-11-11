//
//  CLIP.swift
//  Moments
//
//  Created by Ambrose Ling on 10/11/2024.
//

import Foundation
import SwiftUI
import CoreML
import UIKit
import CoreVideo

final class CLIP : ObservableObject{
    @StateObject private var model = DataModel()
    let imageEncoder = try? CLIP_Image_Encoder_s0(configuration: .init())
    let textEncoder = try? CLIP_Text_Encoder_s0(configuration: .init())
    let tokenizer = CLIPTokenizer()
    var cache = CachedImageManager()

    func pixelBuffer(from image: UIImage) -> CVPixelBuffer? {
        guard let cgImage = image.cgImage else {
            return nil
        }

        let width = cgImage.width
        let height = cgImage.height

        let attributes: [String: Any] = [
            kCVPixelBufferCGImageCompatibilityKey as String: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: true,
            kCVPixelBufferWidthKey as String: width,
            kCVPixelBufferHeightKey as String: height,
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32ARGB
        ]

        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_32ARGB,
            attributes as CFDictionary,
            &pixelBuffer
        )

        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            return nil
        }

        CVPixelBufferLockBaseAddress(buffer, .readOnly)
        let context = CGContext(
            data: CVPixelBufferGetBaseAddress(buffer),
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        )

        if let context = context {
            context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        }
        CVPixelBufferUnlockBaseAddress(buffer, .readOnly)

        return buffer
    }

    

    func generateTextEmbedding(text: String) -> MLMultiArray {
        let tokens = tokenizer.encode(text:text)
        let shape:[NSNumber] = [1,77]
        let multiArrayInput = try? MLMultiArray(shape:shape,dataType: .float16)
        for (index,element) in tokens.enumerated(){
            multiArrayInput?[index] = NSNumber(value:element)
        }
        print(multiArrayInput)
        let input = try? CLIP_Text_Encoder_s0Input(input_text: multiArrayInput!)
        let output = try? self.textEncoder?.prediction(input: input!)
        guard let embeddings =  output?.output_embeddings else{
            fatalError("Cannot receive embeddings")
        }
        print(embeddings)
        return embeddings
    }
    
    func generateImageEmbedding(image: CIImage) async {
        let collection = model.photoCollection
        for asset in collection.photoAssets{
            let imageID = await cache.requestImage(for: asset, targetSize: CGSize(width: 256, height: 256), format: .uiImage){
                result in
                Task {
                    if let result = result?.image {
                        guard let image = try? result as? UIImage else {
                            fatalError("Failed to cast result into UIImage")
                        }
                        let pixelBuffer = self.pixelBuffer(from: image)
                        let input = CLIP_Image_Encoder_s0Input(input_image: pixelBuffer!)
                        let output = try? self.imageEncoder?.prediction(input: input)
                        
                        
                    }
                }
            }
            
        }
    }
    
    func addEntry(){
        
    }
    
    
}
