//
//  PostModel.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation

struct PostModel:Codable{
    let results: [Post]?
}
 
struct Post:Codable{
    let id : Int
    let title : String?
    let body : String?
}


