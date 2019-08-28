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
  
    var mDataArray: [PurpleMobilephoneListModel] = [] {
        didSet {
            mTableView.reloadData()
        }
    }
    
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
        
        print("fav Selected : --->", item.favSelected)

        return cell!
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "cardDetailStoryboard") as? CardDetailViewController
        let item = mDataArray[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "cardDetailStorybaord") as? CardDetailViewController
        let item = mDataArray[indexPath.row]
        vc2?.title = item.name
        
        print("Hello")
        
        self.navigationController?.pushViewController(vc2!, animated: true)
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
//               self.mTableView.reloadData()
            }catch {
                print("---error --->", error.localizedDescription)
            }
        }
    }
    
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
    
    
   
    
   
    
    
    
    
    
    


}

