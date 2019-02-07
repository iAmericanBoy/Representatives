//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Dominic Lanzillotta on 2/7/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation

class RepresentativeController: Codable {
    //MARK: - BaseURL
    static var baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    //MARK: - Read
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative]) -> Void)) {
        guard let baseURL = baseURL else {
            print("Error unwrapping BaseURl")
            completion([])
            return
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchQueryItem = URLQueryItem(name: "state", value: state)
        components?.queryItems = [searchQueryItem,URLQueryItem(name: "output", value: "json")]
        guard let url = components?.url else {
            print("Error unwrapping componentsURL")
            completion([])
            return
        }
        print(url)
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching data for \(state): \(error.localizedDescription)")
                completion([])
                return
            }
            guard data != nil else {
                print("Error unwrapping data.")
                completion([])
                return
            }
            
            let asciiData = String(data: data!, encoding: .ascii)
            let utfData = asciiData?.data(using: .utf8)
            
            guard let unwrappedData = utfData else {
                print("Could not rencode and decode data")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonDic = try decoder.decode([String:[Representative]].self, from: unwrappedData)
                completion(jsonDic["results"] ?? [])
            } catch {
                print("Could not decode data")
                completion([])
                return
            }
        }
        dataTask.resume()
    }
}
