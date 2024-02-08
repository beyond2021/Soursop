//
//  MainView.swift
//  AnimatedTabBar
//
//  Created by KEEVIN MITCHELL on 9/13/22.
//

import SwiftUI
import Lottie

struct MainView: View {
    // MARK: User
    let user: User
    // MARK: View Properties
    @State var currentTab: Tab = .home
    
    // MARK: Color  scheme
    @Environment(\.colorScheme) var scheme
    
    //
    @State var animatedIcons: [AnimatedIcon] = {
        var tabs: [AnimatedIcon] = []
        for tab in Tab.allCases {
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue, bundle: .main)))
        }
        return tabs
        
    }()
    
    init(user: User) {
        self.user = user
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentTab) {
                    FeedView()
                        .setBG()
                        .tag(Tab.home)
                    SearchView()
                        .setBG()
                        .tag(Tab.chat)
                    NotificationsView()
                        .setBG()
                        .tag(Tab.notifications)
                    Text("Saved")
                        .setBG()
                        .tag(Tab.saved)
                    ProfileView(user: user)
                        .setBG()
                        .tag(Tab.account)
                }
                
                // MARK: iOS 14 Update
                if #available(iOS 16, *) {
                    TabBar()
//                        .toolbar(.hidden, in: .tabBar)
                } else {
                    TabBar()
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: logoutButton)
            .accentColor(.black)
            
        }
    }
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            //Tabs
            ForEach(animatedIcons) { icon in
                // MARK: Primary is not working On Xcode 14 Beta
                let tabcolor: SwiftUI.Color = currentTab == icon.tabIcon ? (scheme == .dark ? .white : .black) : .gray.opacity(0.6)
                ResizableLottieView(lottieView: icon.lottieView, color: tabcolor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity)
                    .containerShape(Rectangle())
                    .onTapGesture {
                        // MARK: Updating Current Tab & playing animations
                        currentTab = icon.tabIcon
                        icon.lottieView.play{ _ in
                            // TODO
                            
                        }
                    }
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background {
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
            
        }
        
    }
    /// Log out button logic
    var logoutButton: some View {
        Button(action: {
            AuthViewModel.shared.signOut()
        }) {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    @ViewBuilder
    func setBG() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            
            )
    }
}
