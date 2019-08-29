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
    
    @IBOutlet weak var mSorting: UIBarButtonItem!
    
    @IBOutlet weak var mAllBtn: UIButton!
    @IBOutlet weak var mFavoriteBtn: UIButton!
    
    var id : Int?
    var mobile_image:[String] = []
    var mobile_image_id:[Any] = []
    var mDataArray: [PurpleMobilephoneListModel] = [] {
        didSet {
            mTableView.reloadData()
        }
    }
    
    var mDataArrayForFavorite : [PurpleMobilephoneListModel] = []
    
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
        cell?.mData = item
        

        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc2 = storyboard?.instantiateViewController(withIdentifier: "cardDetailStorybaord") as? CardDetailViewController
        let item = mDataArray[indexPath.row]
        vc2?.title = item.name
        vc2?.vc2DecriptionLabel = item.description
        vc2?.vc2PriceLabel = "Rating : \(String(item.price))"
        vc2?.vc2RatingLabel = "Price: \(String(item.rating))"
        vc2?.vc2ID = item.id
        vc2?.vc2imageURLS = mobile_image
        
        self.navigationController?.pushViewController(vc2!, animated: true)
        

    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TabAllTableViewCell
        
        
        print("cell?.mData.favSelected--->", cell?.mData.favSelected)
        
        if cell?.mData.favSelected == true {
            cell?.mData.favSelected = false
        }else {
             cell?.mData.favSelected = true
        }
    
    }*/
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TabAllTableViewCell
        
        if editingStyle == .delete {
            if cell?.mFavBtn.isSelected == true {
                cell?.mData.favSelected = false
                cell?.mFavBtn.isSelected = false
                filterFavoriteSection()
                
            }
        }
    }
   
    
    
//    Start  feed data
    func feedData() {
        let baseUrl = "https://scb-test-mobile.herokuapp.com/api/mobiles"
        AF.request(baseUrl).response { (response) in
            print("----------> ", response)
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([PurpleMobilephoneListModel].self, from: response.data!)
                print("Result ----> ", result)
                
                print("result data : ---> ", result)
                
                
                
                for items in result {
                    let url_detail = "https://scb-test-mobile.herokuapp.com/api/mobiles/\(items.id)/images/"
                    print("url_detail--->", url_detail)
                    
                    
//                    var mobile_detail_image_list =
//                        FeedData().getDetail_mobileList(url: url_detail, completion: { (result) in
//                            print("mobile result --->", result)
//
//                            //start for loop
//                            for mobile_detail_image in result {
//                                print("mobiledetail list id ", mobile_detail_image.url)
//                                self.mobile_image.append(mobile_detail_image.url)
//                            }
//                             //end for loop
//                        })
                   
                }
                
                self.mDataArray += result
                self.mDataArrayForFavorite = self.mDataArray
    
                 print("---mobile detail list id ", self.mobile_image)
               
                
            }catch {
                print("---error --->", error.localizedDescription)
            }
        }
    }
//    End feed data
    
    
    
    
    
    @IBAction func chickToSort(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sorting", message: "", preferredStyle: .alert)
        
        //price low to hight
        alert.addAction(UIAlertAction(title: "Price low to hight", style: .default, handler: { _ in
            self.mDataArray.sort { (first: PurpleMobilephoneListModel, second: PurpleMobilephoneListModel) -> Bool in
                //asc
                first.price < second.price
            }
            self.mTableView.reloadData()
        }))
        
        //price high to low
        alert.addAction(UIAlertAction(title: "Price hight to low", style: .default, handler: { _ in
            self.mDataArray.sort { (first: PurpleMobilephoneListModel, second: PurpleMobilephoneListModel) -> Bool in
                //desc
                first.price > second.price
            }
            self.mTableView.reloadData()
        }))
        
        //rating low to hight
        alert.addAction(UIAlertAction(title: "Rating low to hight", style: .default, handler: { _ in
            self.mDataArray.sort { (first: PurpleMobilephoneListModel, second: PurpleMobilephoneListModel) -> Bool in
                //desc
                first.rating < second.rating
            }
            self.mTableView.reloadData()
        }))
        
        //rating
        alert.addAction(UIAlertAction(title: "Rating hight to low", style: .default, handler: { _ in
            self.mDataArray.sort { (first: PurpleMobilephoneListModel, second: PurpleMobilephoneListModel) -> Bool in
                //desc
                first.rating > second.rating
            }
            self.mTableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        print("clicked!")
    }
    
    @IBAction func btnAll(sender: UIButton) {
        print("btnAll")
        
        mDataArray = mDataArrayForFavorite
       
    }
    
    @IBAction func btnFavortie(sender: UIButton) {
        filterFavoriteSection()
    }
    
    func filterFavoriteSection() {
        let favourites = mDataArray.filter { $0.favSelected ?? false }
        print(favourites)
        mDataArray = favourites
        mTableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

