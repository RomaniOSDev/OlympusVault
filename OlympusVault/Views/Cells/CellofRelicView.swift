//
//  CellofRelicView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import SwiftUI

struct CellofRelicView: View {
    @StateObject var relic: Relic
    @State private var visibleOptions: Bool = false
    let deleteaction: () -> Void
    let addFavorite: () -> Void
    
    var body: some View {
        ZStack {
            Color.blackblue
            VStack{
                HStack{
                    Image(.lists)
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("\(relic.name ?? "")")
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
                                Text("\(relic.type ?? "")")
                                
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
                                Text("\(relic.rarity ?? "")")
                                
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
                                Text("\(relic.origin ?? "")")
                                
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
                                Text("\(relic.powerLevel)/10")
                                
                            }
                            .padding(10)
                        }
                        .frame(height: 52)
                            .padding(8)
                    }
                    .foregroundStyle(.lightPerple)
                    VStack{
                        Text("Comments & Notes")
                        Text("\(relic.comments ?? "")")
                    }
                    .foregroundStyle(.lightPerple)
                    
                    HStack{
                        Button {
                            deleteaction()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.red, lineWidth: 2)
                                HStack{
                                    Spacer()
                                    Image(systemName: "trash")
                                        
                                    Text("Delete")
                                    Spacer()
                                }
                                .foregroundColor(.red)
                                .padding(8)
                            }
                            
                        }
                        .padding(8)
                        
                        Button {
                            addFavorite()
                        } label: {
                            ZStack{
                                if relic.isFavorite {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.perpleApp)
                                }else {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.perpleApp)
                                }
                                
                                
                                HStack{
                                    Spacer()
                                    Image(systemName: "bookmark")
                                    Text("Added to favorite")
                                    Spacer()
                                }
                                .foregroundStyle(relic.isFavorite ? .black : .lightPerple)
                                .padding(8)
                            }
                        }.padding(8)


                    }
                    .frame(height: 32)
                }
            }.padding()
        }
        .animation(.easeInOut, value: visibleOptions)
        .cornerRadius(20)
    }
}


