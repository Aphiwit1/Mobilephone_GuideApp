//
//  FeedData.swift
//  EventDetail
//
//  Created by AphiwitSCB on 2/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage


class FeedData {
    
    func getDetail_mobileList(url: String, completion: @escaping ([PurpleDetailMobileListModel]) -> Void){
        AF.request(URL(string: url)!, method: .get ).responseJSON { response in
            print(response)
            switch response.result {
            case let .success(value):
//                print("Value : ", value)
                do {
                    let decoder = JSONDecoder()
//                    print("----->Detail Before<-----",response)
                    let result = try decoder.decode([PurpleDetailMobileListModel].self, from: response.data!)
//                    print("-----> Detail Result<-----",response)
                    completion(result)
                    
                } catch let error{
                    print("error case success")
                    print(error)
                }
                break
            case let .failure(error):
                print("error case failure")
                print(error)
                break
            }
        }
    }
    
    
    
}





