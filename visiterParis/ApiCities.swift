//
//  ApiCities.swift
//  visiterParis
//
//  Created by christophe milliere on 25/03/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

import SwiftyJSON
import Alamofire

class ApiCities {
    
    // MARK: - Request Method
    func request(url: String, method: HTTPMethod, params: [String: Any]?, headers: HTTPHeaders, completion: @escaping (DataResponse<Any>) -> ()) {
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            completion(response) }
    }
    func basicHeader() -> HTTPHeaders { return  [ "Accept": "application/json" ] }

    
    
}


// MARK: - API CALLS -
extension ApiCities{
    
    // MARK: - Get all cities
    func getCities(completed: @escaping(String?, JSON?, Int) ->()){
        
        let url = "http://localhost:3000/api/v1/towns"
        
        request(url: url, method: .get, params: nil, headers: basicHeader(), completion:
            {
                response in
                let statusCode = response.response!.statusCode
                
                if response.result.error != nil {
                    completed(response.result.error!.localizedDescription, nil, statusCode)
                } else {
                   completed(nil, JSON(response.result.value as Any), statusCode)
                }
        })
    }
}
