import SwiftUI

struct CollectionListView: View {
    @State private var showAddRelic = false
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
                    if vm.relic.isEmpty {
                        Spacer()
                        EntyLisyView(text: "Your collection is empty")
                        Spacer()
                    }else{
                        ScrollView(content: {
                            ForEach(vm.relic) { relic in
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
                .navigationTitle("Collection")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        NavigationLink {
                            AddRelicView()
                        } label: {
                            HStack{
                                Text("New relic ")
                                Image(systemName: "plus")
                            }
                        }

                        
                    }
                }
                .alert(isPresented: $vm.showDeleteAlert) {
                    Alert(title: Text("Delete?"), message: Text("This action cannot be undone."), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete"), action: {
                        vm.deleteRelic()
                    }))
                }
                .onAppear {
                    print("apear")
                    vm.getRelic()
                }
            }
        }
    }
}

#Preview {
    CollectionListView()
}
