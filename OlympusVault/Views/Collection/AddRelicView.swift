import SwiftUI

struct AddRelicView: View {
    @Environment(\.dismiss) var dismiss
   
    @StateObject var viewModel = AAddReplicViewModel()

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
    
    static let types = [
        "Artifact",
        "Cursed Item",
        "Divine Tool",
        "Enchanted Armor",
        "Gemstone",
        "Idol",
        "Scroll",
        "Weapon"
    ]
    static let rarities = [
        "Common",
        "Uncommon",
        "Rare",
        "Epic",
        "Legendary",
        "Mythic"
    ]

    var body: some View {
        ZStack {
            Color.perpeleApp.ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack(alignment: .leading,spacing: 2) {
                        Text("Name")
                        TextField("", text: $viewModel.name)
                    }
                    .padding()
                    .background {
                        Color.perpleApp.opacity(0.1)
                            .cornerRadius(20)
                    }
                    VStack(alignment: .leading,spacing: 0){
                        Text("Type")
                        HStack {
                            Text("Select type")
                            Spacer()
                            Picker("", selection: $viewModel.type) {
                                ForEach(Self.types, id: \.self) { t in
                                    Text(t)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    .padding()
                    .background {
                        Color.perpleApp.opacity(0.1)
                            .cornerRadius(20)
                    }
                    VStack(alignment: .leading,spacing: 0){
                        Text("Rarity")
                        HStack {
                            Text("Select rarity")
                            Spacer()
                            Picker("", selection: $viewModel.rarity) {
                                ForEach(Self.rarities, id: \.self) { t in
                                    Text(t)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    .padding()
                    .background {
                        Color.perpleApp.opacity(0.1)
                            .cornerRadius(20)
                    }
                    HStack{
                        VStack(alignment: .leading,spacing: 2) {
                            Text("Origin")
                            TextField("", text: $viewModel.origin)
                        }
                        .padding()
                        .background {
                            Color.perpleApp.opacity(0.1)
                                .cornerRadius(20)
                        }
                        
                        VStack(alignment: .leading,spacing: 2) {
                            Slider(value: $viewModel.powerLevel, in: 0...10, step: 1) {
                                Text("Power Level")
                            }
                            Text("\(Int(viewModel.powerLevel))/10")
                        }
                        .padding()
                        .background {
                            Color.perpleApp.opacity(0.1)
                                .cornerRadius(20)
                        }
                    }
                    
                    VStack(alignment: .leading,spacing: 2) {
                        Text("Comments & Notes")
                        ZStack(alignment: .topLeading) {
                            if viewModel.description.isEmpty {
                                Text("Enter description...")
                                    .padding(8)
                                
                            }
                            TextEditor(text: $viewModel.description)
                                .frame(minHeight: 80)
                                .scrollContentBackground(.hidden)
                        }
                        
                    }
                    .padding()
                    .background {
                        Color.perpleApp.opacity(0.1)
                            .cornerRadius(20)
                    }
                    
                }
                .padding()
                .foregroundStyle(.lightPerple)
                .navigationTitle("New relic")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            viewModel.saveReplic()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddRelicView()
    }
}
