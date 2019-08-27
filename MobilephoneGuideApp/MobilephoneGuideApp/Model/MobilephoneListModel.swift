//
//  MobilephoneListModel.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 27/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import Foundation

typealias MobilephoneListModel = [PurpleMobilephoneListModel]

struct PurpleMobilephoneListModel: Codable {
    let rating: Double
    let id: Int
    let thumbImageURL: String
    let price: Double
    let brand, name, description: String
    
    let favButtonPressed: Bool
}

// MARK: Convenience initializers

/*extension PurpleMobilephoneListModel {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(PurpleMobilephoneListModel.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}*/

/*extension Array where Element == MobilephoneListModel.Element {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(MobilephoneListModel.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}*/
