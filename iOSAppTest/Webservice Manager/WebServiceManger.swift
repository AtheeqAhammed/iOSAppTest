//
//  WebServiceManger.swift
//  iOSAppTest
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import Foundation


class WebServiceManger {
    static var shared = WebServiceManger()
    private init(){}
    
    func getRequestFromServer(completion: @escaping ([MovieModel]) -> Void) {
        
        let url = URL(string: "https://www.whats-on-netflix.com/wp-content/plugins/whats-on-netflix/json/alldocs.json?_=1700718031139")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            do {
                let result = try JSONDecoder().decode([MovieModel].self, from: data!)
                print(result)
                completion(result)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
