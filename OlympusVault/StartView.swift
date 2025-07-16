//
//  StartView.swift
//  OlympusVault
//
//  Created by Роман Главацкий on 16.07.2025.
//

import SwiftUI

struct StartView: View {
    
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    @State private var showLoading = true
    @State private var showOnboarding = false

    var body: some View {
        ZStack {
            if showLoading {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showLoading = false
                            showOnboarding = !hasLaunchedBefore
                            if !hasLaunchedBefore {
                                hasLaunchedBefore = true
                            }
                        }
                    }
            } else if showOnboarding {
                OnboardingView(onFinish: {
                    showOnboarding = false
                })
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    StartView()
}
