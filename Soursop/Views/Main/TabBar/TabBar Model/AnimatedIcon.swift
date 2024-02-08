//
//  AnimatedIcon.swift
//  AnimatedTabBar
//
//  Created by KEEVIN MITCHELL on 9/13/22.
//

import SwiftUI
import Lottie

// MARK: Animated Icon Model

struct AnimatedIcon: Identifiable {
    var id = UUID().uuidString
    var tabIcon: Tab
    var lottieView: AnimationView
    
}
