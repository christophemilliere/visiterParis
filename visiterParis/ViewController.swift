//
//  ViewController.swift
//  visiterParis
//
//  Created by christophe milliere on 25/03/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var cityList = [City]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        func cityCompleted(err: String?, json: JSON?, status: Int)
        {
            if err != nil {
                print("handle failure here")
            } else {
                for city in json!.arrayValue {
                    
                    let c = City(name: city["name"].stringValue, id: city["id"].intValue)
                    self.cityList.append(c)
                }
            }
            
            self.tableview.reloadData()
            dismiss(animated: true, completion: nil)
        }
        ApiCities().getCities(completed: cityCompleted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

