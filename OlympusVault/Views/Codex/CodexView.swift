//
//  CodexView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import SwiftUI

struct CodexView: View {
    @StateObject private var vm = CodexViewModel()
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
    var body: some View {
        NavigationStack {
            ZStack {
                Color.perpeleApp.ignoresSafeArea()
                VStack {
                   
                        ScrollView(content: {
                            ForEach(vm.codexs) { codex in
                                CellForCodexView(codex: codex)
                                
                            }
                        })
                    
                }
                .padding()
                .navigationTitle("Relic Codex")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CodexView()
}
