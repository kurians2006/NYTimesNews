//
//  Constants.swift
//  NYTimesNews
//
//  Created by Naeem Paracha on 13/10/2021.
//

import Foundation

struct Constants {
    
    //Config and base URL
    static let baseURL = "https://api.nytimes.com/svc/mostpopular/v2"
    static let apiKey = "9LGA576gBwZAaowRPOdu9vrR9eJlp6ED"
    static let apiKeyParam = "?api-key="
    static let path = "/mostviewed/all-sections/7.json"
    
    static func URLForApi(path: String = "") -> URL? {
        return URL(string: Constants.baseURL + (path.count == 0 ? Constants.path : path) + Constants.apiKeyParam + Constants.apiKey)
    }
    
    
    //Cell idenfiers to use cell in table or collection view
    struct CellIdentifiers {
        static let bookCell = "BookCell"
        static let introCell = "IntroCell"
    }
    
    
    //Segue identifiers use to move between view controllers
    struct SegueIdentifiers {
        static let toLibraries = "ToLibraries"
        static let toBooks = "ToBooks"
        static let toBook = "ToBook"
        static let toCart = "ToCart"
    }
    
}
