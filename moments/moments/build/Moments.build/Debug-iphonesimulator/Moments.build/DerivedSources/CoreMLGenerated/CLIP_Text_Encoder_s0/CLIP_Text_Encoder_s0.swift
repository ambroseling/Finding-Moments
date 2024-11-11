//
// CLIP_Text_Encoder_s0.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
class CLIP_Text_Encoder_s0Input : MLFeatureProvider {

    /// input_text as 1 by 77 matrix of 16-bit floats
    var input_text: MLMultiArray

    var featureNames: Set<String> {
        get {
            return ["input_text"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "input_text") {
            return MLFeatureValue(multiArray: input_text)
        }
        return nil
    }
    
    init(input_text: MLMultiArray) {
        self.input_text = input_text
    }

    
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    convenience init(input_text: MLShapedArray<Float16>) {
        self.init(input_text: MLMultiArray(input_text))
    }

}


/// Model Prediction Output Type
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
class CLIP_Text_Encoder_s0Output : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// output_embeddings as 1 by 512 matrix of 16-bit floats
    var output_embeddings: MLMultiArray {
        return self.provider.featureValue(for: "output_embeddings")!.multiArrayValue!
    }

    /// output_embeddings as 1 by 512 matrix of 16-bit floats
    
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    var output_embeddingsShapedArray: MLShapedArray<Float16> {
        return MLShapedArray<Float16>(self.output_embeddings)
    }

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(output_embeddings: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["output_embeddings" : MLFeatureValue(multiArray: output_embeddings)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
class CLIP_Text_Encoder_s0 {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "CLIP_Text_Encoder_s0", withExtension:"mlmodelc")!
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of CLIP_Text_Encoder_s0.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `CLIP_Text_Encoder_s0.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(configuration: MLModelConfiguration = MLModelConfiguration()) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<CLIP_Text_Encoder_s0, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> CLIP_Text_Encoder_s0 {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<CLIP_Text_Encoder_s0, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(CLIP_Text_Encoder_s0(model: model)))
            }
        }
    }

    /**
        Construct CLIP_Text_Encoder_s0 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> CLIP_Text_Encoder_s0 {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return CLIP_Text_Encoder_s0(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CLIP_Text_Encoder_s0Input

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CLIP_Text_Encoder_s0Output
    */
    func prediction(input: CLIP_Text_Encoder_s0Input) throws -> CLIP_Text_Encoder_s0Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CLIP_Text_Encoder_s0Input
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CLIP_Text_Encoder_s0Output
    */
    func prediction(input: CLIP_Text_Encoder_s0Input, options: MLPredictionOptions) throws -> CLIP_Text_Encoder_s0Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return CLIP_Text_Encoder_s0Output(features: outFeatures)
    }

    /**
        Make an asynchronous prediction using the structured interface

        - parameters:
           - input: the input to the prediction as CLIP_Text_Encoder_s0Input
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CLIP_Text_Encoder_s0Output
    */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: CLIP_Text_Encoder_s0Input, options: MLPredictionOptions = MLPredictionOptions()) async throws -> CLIP_Text_Encoder_s0Output {
        let outFeatures = try await model.prediction(from: input, options:options)
        return CLIP_Text_Encoder_s0Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - input_text as 1 by 77 matrix of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CLIP_Text_Encoder_s0Output
    */
    func prediction(input_text: MLMultiArray) throws -> CLIP_Text_Encoder_s0Output {
        let input_ = CLIP_Text_Encoder_s0Input(input_text: input_text)
        return try self.prediction(input: input_)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - input_text as 1 by 77 matrix of 16-bit floats

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as CLIP_Text_Encoder_s0Output
    */

    
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    func prediction(input_text: MLShapedArray<Float16>) throws -> CLIP_Text_Encoder_s0Output {
        let input_ = CLIP_Text_Encoder_s0Input(input_text: input_text)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [CLIP_Text_Encoder_s0Input]
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [CLIP_Text_Encoder_s0Output]
    */
    func predictions(inputs: [CLIP_Text_Encoder_s0Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [CLIP_Text_Encoder_s0Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [CLIP_Text_Encoder_s0Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  CLIP_Text_Encoder_s0Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}
