//
//  ViewController.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 27/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var mDataArray: [PurpleMobilephoneListModel] = []
    @IBOutlet weak var  mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabAllCell") as? TabAllTableViewCell
        let item = mDataArray[indexPath.row]
        cell?.mMobileName.text = item.name
        cell?.mMobilePrice.text = "Price: $\(String(item.price))"
        cell?.mMobileDescription.text = item.description
        cell?.mMobileRating.text = "Rating: \(String(item.rating))"
        cell?.mImageView.loadImage(url: item.thumbImageURL)
        

        
        return cell!
    }
    
    
    
    func feedData() {
        let baseUrl = "https://scb-test-mobile.herokuapp.com/api/mobiles"
        AF.request(baseUrl).response { (response) in
            print("----------> ", response)
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([PurpleMobilephoneListModel].self, from: response.data!)
                print("Result ----> ", result)
                
                for item in result {
                    print("item, --------------> ", item)
                }
               self.mDataArray += result
               self.mTableView.reloadData()
            }catch {
                print("---error --->", error.localizedDescription)
            }
        }
        
    }


}

