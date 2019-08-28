//
//  CardDetailViewController.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 28/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet weak var mDetailPrice: UILabel!
    @IBOutlet weak var mDetailRating: UILabel!
    @IBOutlet weak var mDetailDescription: UILabel!
    
    
     var mDataArray: [PurpleMobilephoneListModel] = []
    
    var vc2PriceLabel = ""
    var vc2RatingLabel = ""
    var vc2DecriptionLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
   
       mDetailPrice.text = vc2PriceLabel
       mDetailRating.text = vc2RatingLabel
       mDetailDescription.text = vc2DecriptionLabel
        
    }
    


}
