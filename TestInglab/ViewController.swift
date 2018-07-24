//
//  ViewController.swift
//  TestInglab
//
//  Created by Haoyi Thong on 24/07/2018.
//  Copyright © 2018 Thong. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView?
    var itemArray: [ItemModel] = []
    var displayItemArray: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Developer"
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
        callApi()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController{
    func callApi() {
        let url: String = "https://api.myjson.com/bins/a9eh1"
        Alamofire.request(url).responseJSON { (response) in
            guard response.result.isSuccess else {
                //do error checking
                return
            }
            
            if let result = response.result.value as? NSArray{
                print(result)
                self.itemArray = ItemModel.parse(data: result)
                self.displayItemArray = self.itemArray.filter{$0.isActive == true}
                self.displayItemArray.sort(by: { $0.index < $1.index })
                self.tableView?.reloadData()
            }
            
            
            
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        let storyboard = self.storyboard
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.initData(model: self.displayItemArray[row])
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
            
            let item = self.displayItemArray[row]
            
            cell.titleLabel?.text = item.name
            cell.descriptionLabel?.text = item.phone
            return cell
        }
        else {
            return UITableViewCell()
        }
        
        
    }
    
    
}
