//
//  TableviewMainExtension.swift
//  visiterParis
//
//  Created by christophe milliere on 02/04/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! CityTableViewCell

        // Configure Cell
        cell.labelName?.text = self.cityList[indexPath.row].name
        
        return cell
    }

}
