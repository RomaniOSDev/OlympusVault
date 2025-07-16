//
//  SettingsView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 16.07.2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .blackblue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var isPresentShare: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.perpeleApp.ignoresSafeArea()
                VStack(spacing: 15) {
                    Button {
                        isPresentShare.toggle()
                    } label: {
                        SettingButtonView(text: "Share the app", imageName: "square.and.arrow.up")
                    }
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        SettingButtonView(text: "Rate the app", imageName: "star")
                    }
                    Button {
                        if let url = URL(string: "https://www.termsfeed.com/live/26b5b286-7210-4cca-89f5-cd4a79706b66") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        SettingButtonView(text: "Usage policy", imageName: "text.document")
                    }

                    
                }
                .sheet(isPresented: $isPresentShare, content: {
                    ShareSheet(items: urlShare )
                })
                .padding()
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
