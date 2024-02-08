//
//  ResizableLottieView.swift
//  AnimatedTabBar
//
//  Created by KEEVIN MITCHELL on 9/13/22.
//

import SwiftUI
import Lottie


// MARK: Resizable Lottie View
struct ResizableLottieView: UIViewRepresentable {
    var lottieView: AnimationView
    var color: SwiftUI.Color = .black
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // MARK: Dynamic Color Update
        // Finding Attached Lottie View
        
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView {
            // MARK: Finding Keypaths with the help of Log
            // Key might change due to lottie file
            // use log to find appropriate key
            // lottieView.logHierarchyKeypaths()
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            // MARK: Fill keypath
            let fillKeyPath = AnimationKeypath(keys: ["**","Fill 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            // MARK: Stroke Keypath
            let strokeKeyPath = AnimationKeypath(keys: ["**","Stroke 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
            // MARK: Stroke Keypath
        }
        
    }
    
    func addLottieView(to: UIView) {
        // MARK: Memory Properties
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        to.addSubview(lottieView)
        to.addConstraints(constraints)
        
    }
}


