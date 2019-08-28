//
//  CardDetailViewController.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 28/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
    mCollectionView.delegate = self
    mCollectionView.dataSource = self
       mDetailPrice.text = vc2PriceLabel
       mDetailRating.text = vc2RatingLabel
       mDetailDescription.text = vc2DecriptionLabel
        print("image : ", vc2imageURLS)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vc2imageURLS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as? CardDetailCollectionViewCell
        
        
        print("Hello")
        cell?.mMobileCollectionView.loadImage(url: vc2imageURLS[indexPath.row])
   
        return cell!
    }
    


}
