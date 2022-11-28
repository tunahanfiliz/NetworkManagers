//
//  PostViewModel.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation

class PostViewModel{
    var postId = 0
    var postItems = [Post]()
    var commentItems = [Comment]()
    
    
    func getPost(completion:@escaping ((String?)->Void)){ //burda direkt network manager diyip çagırmadık çunku proje degişirse bozardı o yüzden gittik postmanager olusturduk
        //burda birdaha completion lazım viewcontrollere call back vermesi için
        PostManager.shared.getPostItems { posts, errorMasage in
            if let posts = posts{
                self.postItems = posts
            }
            
            completion(errorMasage)
        }
    }
    
    func getComment(completion:@escaping ((String?)->Void)){
        PostManager.shared.getComment(postId: postId) { comments,errorMessage in
            if let comments = comments{
                self.commentItems = comments
            }
            completion(errorMessage)
        }
    }
}
