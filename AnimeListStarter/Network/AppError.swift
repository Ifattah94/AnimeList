//
//  AppError.swift
//  AnimeListStarter
//
//  Created by C4Q on 10/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
