//
//  City.swift
//  visiterParis
//
//  Created by christophe milliere on 26/03/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

class City: NSObject {
    
    private var _id:Int
    private var _name:String
    
    init(name: String, id: Int) {
        self._name = name
        self._id = id
    }
    
    var id:Int{
        get{return _id}
    }

    var name:String{
        get{return _name}
    }

}
