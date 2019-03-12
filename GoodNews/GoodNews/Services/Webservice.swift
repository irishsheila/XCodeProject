//
//  Webservice.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class Webservice {
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        } .resume()
    }
    
}
