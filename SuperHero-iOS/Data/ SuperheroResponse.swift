// SuperheroResponse.swift
// SuperHero-iOS
//
// Created by Tardes on 20/12/24.

import Foundation

struct SuperheroResponse: Codable {
    let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
    let image: Image
    let biography: Biography
    let powerstats: PowerStats
}

struct Biography: Codable {
    let realName: String
    let publisher: String
    let alignment: String
    let placeOfBirth: String
    
    private enum CodingKeys: String, CodingKey {
        case alignment, publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

struct PowerStats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
    
    // Función para convertir las cadenas a enteros (opcional)
    func convertToNumeric() -> PowerStatsNumeric {
        return PowerStatsNumeric(
            intelligence: Int(intelligence) ?? 0,
            strength: Int(strength) ?? 0,
            speed: Int(speed) ?? 0,
            durability: Int(durability) ?? 0,
            power: Int(power) ?? 0,
            combat: Int(combat) ?? 0
        )
    }
}

struct PowerStatsNumeric {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Image: Codable {
    let url: String?
}
