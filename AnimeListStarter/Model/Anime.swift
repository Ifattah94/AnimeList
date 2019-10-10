//
//  Anime.swift
//  AnimeListStarter
//
//  Created by C4Q on 10/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
struct AnimeResultsWrapper: Codable {
    let results: [Anime]
    
    static func getAnimeFromData(data: Data) throws ->  [Anime] {
        var animeArr = [Anime]()
        do {
            let info = try JSONDecoder().decode(AnimeResultsWrapper.self, from: data)
            animeArr = info.results
            
        } catch {
            print(error)
        }
        return animeArr
    }
    
}

struct Anime: Codable {
    let id: Int
    let imageUrl: String
    let title: String
    let synopsis: String
    let episodes: Int?
    let score: Double
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case imageUrl = "image_url"
        case title
        case synopsis
        case episodes
        case score
    }
    
    
    
    
    func existsInFavorites() -> Bool? {
        do {
            let allSavedAnime = try AnimePersistenceManager.manager.getAnime()
            if allSavedAnime.contains(where: {$0.id == self.id}) {
                return true
            } else {
                return false
            }
        } catch {
            print(error)
            return nil
        }
    }

}
