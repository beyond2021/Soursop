//
//  SoursopApp.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI
import Firebase


/// Firebase docs
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}




@main
struct SoursopApp: App {
    /// Firebase docs
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    ///  Stephan
//    init()  {
//        FirebaseApp.configure()
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
                .preferredColorScheme(.light)
        }
    }
}
