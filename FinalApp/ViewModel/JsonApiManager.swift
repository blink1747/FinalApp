//
//  JsonApiManager.swift
//  FinalAssignment
//
//  Created by IMCS on 9/4/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import Foundation
import UIKit

class JsonApiManager {
    
    
    static func fetchData( onCompletion : @escaping ([ArtistData]) -> Void) {
        var artistDataArray = [ArtistData]()
        let str = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        let url = URL(string: str)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                if let data = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        let feed = jsonResult?["feed"] as! NSDictionary
                        
                        let result = feed["results"] as! NSArray
                        
                        for r in result{
                            let artistData = ArtistData()
                            let k = r as! NSDictionary
                            artistData.artistName = k["artistName"] as! String
                            artistData.releasedDate = k["releaseDate"] as! String
                            artistDataArray.append(artistData)
                        }
                        
                        onCompletion(artistDataArray)
                        
                    } catch {
                        print("Error Fetching")
                    }
                }
            }
            
        }
        task.resume()
        
        
    }
}
