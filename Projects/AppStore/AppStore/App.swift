//
//  App.swift
//  AppStore
//
//  Created by Ludovic Ollagnier on 06/11/2020.
//

import Foundation

struct App: Codable {

    let name: String
    let subtitle: String

    let keywords: Set<String>
    let categorie: Categorie

    let note: Float
    let minAge: Int

    let haveInAppPurchases: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case subtitle = "description"
        case keywords
        case categorie
        case note
        case minAge = "age_min"
        case haveInAppPurchases
    }
}

enum Categorie: String, Codable {
    case lifestyle
    case game
    case navigation
}
