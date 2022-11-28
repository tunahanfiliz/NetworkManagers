//
//  Post.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation

class PostManager{
    static let shared = PostManager()
    
    func getPostItems(completion:@escaping (([Post]?,String?)->Void)){ //post döndürcez bi de hata için string
        let url = "\(NetworkHelper.shared.baseURL)posts"
        NetworkManager.shared.request(type: [Post].self, url: url, method: .get) { response in
            switch response{
            case .success(let post):
                completion(post,nil)
            case .failure(let error):
                completion(nil,error.rawValue)
                
            }
        }
    }
    
    func getComment(postId:Int,completion:@escaping (([Comment]?,String?)->Void)){
        let url = "\(NetworkHelper.shared.baseURL)comments?postId=\(postId)"
        NetworkManager.shared.request(type: [Comment].self, url: url, method: .get) { response in
            switch response{
            case .success(let comment):
                completion(comment, nil)
            case .failure(let error):
                completion(nil,error.rawValue)
                
            }
        }
    }
}
