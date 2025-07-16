//
//  FavoriteView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject private var vm = CollectionListViewModel()
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
                    if vm.favoriteRelic.isEmpty {
                        Spacer()
                        EntyLisyView(text: "No favorites yet")
                        Spacer()
                    }else{
                        ScrollView(content: {
                            ForEach(vm.favoriteRelic) { relic in
                                CellofRelicView(relic: relic) {
                                    vm.tapToDeleteAlert(relic)
                                } addFavorite: {
                                    vm.changeIsFavorite(relic)
                                }
                                
                            }
                        })
                    }
                }
                .padding()
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $vm.showDeleteAlert) {
                    Alert(title: Text("Delete?"), message: Text("This action cannot be undone."), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete"), action: {
                        vm.deleteRelic()
                    }))
                }
                .onAppear {
                    vm.getRelic()
                    vm.getFavoriteRelic()
                }
            }
        }
    }
}

#Preview {
    FavoriteView()
}
