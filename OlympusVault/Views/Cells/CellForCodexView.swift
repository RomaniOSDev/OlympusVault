//
//  CellForCodexView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import SwiftUI

struct CellForCodexView: View {
     var codex: Codex
    @State private var visibleOptions: Bool = false
    
    var body: some View {
        ZStack {
            Color.blackblue
            VStack{
                HStack{
                    Image(systemName: "book.closed")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.lightPerple)
                    Text("\(codex.name)")
                        .foregroundStyle(.lightPerple)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    
                    Button {
                        visibleOptions.toggle()
                    } label: {
                        Image(systemName: !visibleOptions ? "chevron.compact.down" : "chevron.compact.up")
                            .foregroundStyle(.lightPerple)
                    }

                }
                if visibleOptions {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.perpeleApp)
                            VStack{
                                Text("type")
                                Text("\(codex.type)")
                                
                            }
                            .padding(10)
                        }
                        .frame(height: 52)
                        .padding(8)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.perpeleApp)
                            VStack{
                                Text("Rarity")
                                Text("\(codex.rarity)")
                                
                            }
                            .padding(10)
                        }
                        .frame(height: 52)
                            .padding(8)
                    }
                    .foregroundStyle(.lightPerple)
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.perpeleApp)
                            VStack{
                                Text("Origin")
                                Text("\(codex.origin)")
                                
                            }
                            .padding(10)
                        }
                        .frame(height: 52)
                        .padding(8)
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.perpeleApp)
                            VStack{
                                Text("Power level")
                                Text("\(codex.powerLevel)")
                                
                            }
                            .padding(10)
                        }
                        .frame(height: 52)
                            .padding(8)
                    }
                    .foregroundStyle(.lightPerple)
                    VStack{
                        Text("Mythical Lore")
                        Text("\(codex.mythicalLore)")
                    }
                    .foregroundStyle(.lightPerple)
                    
                }
            }.padding()
        }
        .animation(.easeInOut, value: visibleOptions)
        .cornerRadius(20)
    }
}

#Preview {
    CellForCodexView(codex: Codex(name: "Aegis", type: "Enchanted Armor", origin: "Olympus", rarity: " Legendary", powerLevel: 9, mythicalLore: "The divine shield wielded by Zeus and Athena, adorned with the head of Medusa. It radiates terror and grants invincibility to its bearer."))
}
