//
//  NetworkHelper.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation

enum HTTPMethods:String{
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes:String,Error{
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    let header = ["Auth":"Bearer"]
    
    func saveToken(token:String){
        
    }
}
