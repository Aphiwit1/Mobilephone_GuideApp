//
//  TabAllTableViewCell.swift
//  MobilephoneGuideApp
//
//  Created by AphiwitSCB on 27/8/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

class TabAllTableViewCell: UITableViewCell {
    
    var mData: PurpleMobilephoneListModel!
    
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
        if mFavBtn.isSelected == true {
            mData.favSelected = true
            print(mData.favSelected)
        }else if mFavBtn.isSelected == false {
            mData.favSelected = false
        }
        
    }

}
