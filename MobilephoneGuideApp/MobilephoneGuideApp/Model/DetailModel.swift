//
//  DetailModel.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 28/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import Foundation


struct MobileJSONElement: Codable {
    let url: String
    let id, mobileID: Int
    
    enum CodingKeys: String, CodingKey {
        case url, id
        case mobileID = "mobile_id"
    }
}

typealias MobileJSON = [MobileJSONElement]
