//
//  MobilephoneListModel.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 27/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import Foundation

typealias MobilephoneListModel = [PurpleMobilephoneListModel]

class  PurpleMobilephoneListModel: Codable {
    let rating: Double
    let id: Int
    let thumbImageURL: String
    let price: Double
    let brand, name, description: String
    
    var favSelected: Bool? = false
}


