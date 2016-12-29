//
//  MeetupService.swift
//  BrowseMeetup
//
//  Created by Simon Ng on 28/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation

typealias JSONDictionary = Dictionary<String, Any>
let MEETUP_API_KEY = "1f5718c16a7fb3a5452f45193232"

final class MeetupService {
    
    var baseUrl: String = "https://api.meetup.com/"
    lazy var session: URLSession = URLSession.shared
    
    func fetchMeetupGroupInLocation(latitude: Double, longitude: Double, completion: @escaping (_ results: [JSONDictionary]?, _ error: Error?) -> ()) {
        print("\(baseUrl)find/groups?&lat=\(latitude)&lon=\(longitude)&page=10&key=\(MEETUP_API_KEY)")
        guard let url = URL(string: "\(baseUrl)find/groups?&lat=\(latitude)&lon=\(longitude)&page=10&key=\(MEETUP_API_KEY)") else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                do {
                    let results = try JSONSerialization.jsonObject(with: data!) as? [JSONDictionary]
                    completion(results, nil);
                    
                } catch let underlyingError {
                    completion(nil, underlyingError);
                }
            })
            }.resume()
    }
}
