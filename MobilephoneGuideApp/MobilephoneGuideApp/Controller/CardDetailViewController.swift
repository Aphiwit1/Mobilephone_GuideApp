//
//  CardDetailViewController.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 28/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CardDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var mDetailPrice: UILabel!
    @IBOutlet weak var mDetailRating: UILabel!
    @IBOutlet weak var mDetailDescription: UILabel!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    
    var mDataArray: [PurpleDetailMobileListModel] = []
    
    var vc2imageURLS : [String] = []
    
    var vc2PriceLabel = ""
    var vc2RatingLabel = ""
    var vc2DecriptionLabel = ""
    var vc2ID: Int!
    
    var imageArray: [String] = []
    var number = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    mCollectionView.delegate = self
    mCollectionView.dataSource = self
       mDetailPrice.text = vc2PriceLabel
       mDetailRating.text = vc2RatingLabel
       mDetailDescription.text = vc2DecriptionLabel
        
        getDetail_mobileList()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as? CardDetailCollectionViewCell
        
        
        cell?.mMobileCollectionView.loadImage(url: imageArray[indexPath.row])
   
        return cell!
    }
    
    
    func getDetail_mobileList() {
        
        self.number = self.vc2ID
        print(self.number)
        print("vc2 id", self.vc2ID)
                let baseUrl = "https://scb-test-mobile.herokuapp.com/api/mobiles/\(self.number)/images/"

        AF.request(URL(string: baseUrl)!, method: .get ).responseJSON { response in
            print(response)
            switch response.result {
            case let .success(value):
                do {
                    let decoder = JSONDecoder()

                    let result = try decoder.decode([PurpleDetailMobileListModel].self, from: response.data!)
                    for i in result {
                        print(" i ", i.url)
                       self.imageArray.append(i.url)
                    }
                   self.mCollectionView.reloadData()
                    
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
