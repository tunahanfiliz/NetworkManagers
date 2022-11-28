//
//  CommentModel.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation

struct CommentModel:Codable{
    let results:[Comment]?
}

struct Comment:Codable{
    let id:Int
    let name:String?
    let email:String?
    let body:String?
}
