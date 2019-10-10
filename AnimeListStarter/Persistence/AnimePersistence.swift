//
//  AnimePersistence.swift
//  AnimeListStarter
//
//  Created by C4Q on 10/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
struct AnimePersistenceManager {
    private init() {}
    static let manager = AnimePersistenceManager()
    
     private let persistenceHelper = PersistenceHelper<Anime>(fileName: "anime.plist")
    
    func saveAnime(anime: Anime) throws {
        try persistenceHelper.save(newElement: anime)
        
    }
    
    func getAnime() throws -> [Anime] {
        return try persistenceHelper.getObjects()
    }
    
}
