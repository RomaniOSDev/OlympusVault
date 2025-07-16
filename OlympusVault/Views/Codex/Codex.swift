//
//  Codex.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//
import Foundation


struct Codex: Identifiable {
    var id = UUID()
    
    var name: String
    var type: String
    var origin: String
    var rarity: String
    var powerLevel: Int
    var mythicalLore: String
}
