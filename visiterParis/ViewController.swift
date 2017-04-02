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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cityList = [City]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        let api = ApiCities()
        
        // Do any additional setup after loading the view, typically from a nib.
        //api.cities(url: "http://localhost:3000/api/v1/towns")
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = self.cityList.count
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! CityTableViewCell
        
        let name = self.cityList[indexPath.row].name
        // Configure Cell
        cell.labelName?.text = name
        
        return cell
    }


}

