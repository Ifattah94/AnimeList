//
//  AnimeListStarterTests.swift
//  AnimeListStarterTests
//
//  Created by C4Q on 10/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import XCTest
@testable import AnimeListStarter

class AnimeListStarterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testAnimeModelFromJson() {
        
        guard let path = Bundle.main.path(forResource: "Anime", ofType: "json") else {
            print("No Path to JSON")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let animeArr = try AnimeResultsWrapper.getAnimeFromData(data: data)
            XCTAssert(animeArr.count > 0, "We have \(animeArr.count) anime")
        } catch {
            print(error)
            XCTFail()
        }

}

}
