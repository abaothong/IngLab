//
//  SecondViewController.swift
//  TestInglab
//
//  Created by Haoyi Thong on 24/07/2018.
//  Copyright © 2018 Thong. All rights reserved.
//

import UIKit
import Kingfisher
class SecondViewController: UIViewController {
    
    var itemModel: ItemModel? = nil
    
    @IBOutlet var imageView: UIImageView?
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var emailField: UITextField?
    @IBOutlet var balanceField: UITextField?
    @IBOutlet var remarkView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField?.isUserInteractionEnabled = false
        emailField?.isUserInteractionEnabled = false
        balanceField?.isUserInteractionEnabled = false
        remarkView?.isUserInteractionEnabled = false
        
        if self.itemModel != nil {
            self.nameField?.text = self.itemModel?.name
            self.emailField?.text = self.itemModel?.email
            self.balanceField?.text = self.itemModel?.balance
            
            let url = URL(string: (self.itemModel?.picture)!)
            
            self.imageView?.kf.setImage(
                with: url,
                placeholder: #imageLiteral(resourceName: "placeholder"),
                options: nil,
                progressBlock: nil,
                completionHandler: {
                    (image, error, cacheType, imageURL) -> () in
                    // remove loading view
            }
            )
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SecondViewController {
    func initData(model: ItemModel) {
        self.itemModel = model
    }
    
    @IBAction func reviewClick() {
        self.remarkView?.isHidden = !(self.remarkView?.isHidden)!
    }
}
