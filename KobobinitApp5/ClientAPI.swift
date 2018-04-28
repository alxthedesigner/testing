//
//  ClientAPI.swift
//  
//
//  Created by Alex Stanford on 4/26/18.
//

import UIKit
import Stripe
import Alamofire

class ClientAPI: NSObject, STPEphemeralKeyProvider {

    let baseURL = URL(string: "https://api.stripe.com")
    
    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        let url = self.baseURL?.appendingPathComponent("ephemeral_keys")
        Alamofire.request(url!, method: .post, parameters: [
            "apiVersion": apiVersion,
            "customerId" : "cus_Cks1ITK7xlTM1U"
            ])
            .validate(statusCode: 200..<300)
            .responseJSON { responseJSON in
                switch responseJSON.result {
                case .success(let json):
                    completion(json as? [String: AnyObject], nil)
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
}
