//
//  CollectionListViewModel.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//
import Foundation
import CoreData

final class CollectionListViewModel: ObservableObject {
    @Published var relic: [Relic] = []
    @Published var favoriteRelic: [Relic] = []
    @Published var showDeleteAlert: Bool = false
    var simpleRelic: Relic?
    
    let manager  = CoreDataManager.instance
    
    init(){
        getRelic()
        getFavoriteRelic()
    }
    
    func getRelic() {
        let request: NSFetchRequest<Relic> = Relic.fetchRequest()
        do {
            relic = try manager.container.viewContext.fetch(request)
        } catch {
            print("Failed to fetch relics: \(error)")
        }
    }
    
    func getFavoriteRelic() {
        favoriteRelic = relic.filter({ $0.isFavorite })
    }
    
    func changeIsFavorite(_ relic: Relic) {
        relic.isFavorite.toggle()
        manager.save()
        getRelic()
        getFavoriteRelic()
    }
    
    func deleteRelic() {
        if let relic = simpleRelic {
            manager.context.delete(relic)
            manager.save()
            getRelic()
            getFavoriteRelic()
        }
        
    }
    
    func tapToDeleteAlert(_ relic: Relic) {
        simpleRelic = relic
        showDeleteAlert.toggle()
    }
}
