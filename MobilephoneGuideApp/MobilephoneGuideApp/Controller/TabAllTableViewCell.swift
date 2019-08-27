//
//  TabAllTableViewCell.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 27/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

class TabAllTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImageView: UIImageView!
    
    
    @IBOutlet weak var mMobileName: UILabel!
    @IBOutlet weak var mMobileDescription: UILabel!
    @IBOutlet weak var mMobilePrice: UILabel!
    @IBOutlet weak var mMobileRating: UILabel!
    @IBOutlet weak var mFavBtn: UIButton!
   


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func chackFavButtonPressed(sender: UIButton) {
        mFavBtn.isSelected = !sender.isSelected
//        if mFavBtn.isSelected {
////            mFavBtn.setImage(UIImage(named: "starSelected"), for: .selected)
//            mFavBtn.isSelected = sender.isSelected
//        }else {
////            mFavBtn.setImage(UIImage(named: "starDefault"), for: .normal)
//            mFavBtn.isSelected = true
//        }
        
//        if sender.isSelected == true {
//             sender.setImage(UIImage(named: "starSelected"), for: .normal)
//        }else {
//             sender.setImage(UIImage(named: "starDefault"), for: .normal)
//        }
        
        
    }

}
