//
//  Untitled.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import Foundation

final class AAddReplicViewModel: ObservableObject {
    private let manager = CoreDataManager.instance
    
    @Published var name: String = "Enter name"
    @Published var type: String = ""
    @Published var rarity: String = ""
    @Published var origin: String = "Enter Origin"
    @Published var powerLevel: Double = 0.0
    @Published var description: String = ""
    
    func saveReplic() {
        let newReplic = Relic(context: manager.context)
        newReplic.name = name
        newReplic.type = type
        newReplic.rarity = rarity
        newReplic.origin = origin
        newReplic.powerLevel = Int16(powerLevel)
        newReplic.comments = description
        
        manager.save()
        clearData()
    }
    
    func clearData() {
        name = ""
        type = ""
        rarity = ""
        origin = ""
        powerLevel = 0.0
        description = ""
    }
    
}
