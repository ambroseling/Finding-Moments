//
//  ContentView.swift
//  Moments
//
//  Created by Ambrose Ling on 29/10/2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.applyCustomAppearance()
    }
    var body: some View {
      CameraView()
    }
}

fileprivate extension UINavigationBar {
    
    static func applyCustomAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
