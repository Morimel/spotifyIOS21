//
//  tracksModel.swift
//  spotifyIOS21
//
//  Created by Isa Melsov on 9/2/24.
//

import Foundation

struct Album: Codable {
    let albumType: String
    let artists: [Artist]
    let availableMarkets: [String]
    let externalUrls: [String: String]
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let releaseDate: String
    let releaseDatePrecision: String
    let totalTracks: Int
    let type: String
    let uri: String
}

struct Artist: Codable {
    let externalUrls: [String: String]
    let href: String
    let id: String
    let name: String
    let type: String
    let uri: String
}

struct Image: Codable {
    let height: Int
    let url: String
    let width: Int
}

struct Track: Codable {
    let album: Album
    let artists: [Artist]
    let availableMarkets: [String]
}

struct SearchResponse: Codable {
    let tracks: Track
}
