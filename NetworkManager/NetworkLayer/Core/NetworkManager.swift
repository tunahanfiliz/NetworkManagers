//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import Foundation
import Alamofire

class NetworkManager{
    static let shared = NetworkManager()
 //neye göre parse edecegini bilmedigi için yani hangi modelde işlem yapacagı bilinmiyor o yuzden t type deriz
    func request<T:Codable>(type:T.Type,url:String, method:HTTPMethod, completion: @escaping ((Result<T,ErrorTypes>)->())) {
       /* let session = URLSession.shared
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            let dataTask = session.dataTask(with: request) { data,response , error in
                if let _ = error{
                    completion(.failure(.generalError))
                }else if let data = data{
                    self.handleResponse(data: data) { response in //bize handleresponseden gelen responseyi degerlendircez
                        //responsemiz zaten t tipi geldigi için completion yazdık
                        completion(response)//responseyi geri gönderdik
                    }
                    
                }else {
                    completion(.failure(.invalidURL))
                }
            }
            dataTask.resume()
        }*/
        
        
        
        
        //BURDA OF YANİ HANGİ MODELE GÖRE PARSE ETCEGİNİ SORUYO VE OTOMATİK PARS EDİO
        /*AF.request(url,method: method).responseDecodable(of: T.self) { response in
            switch response.result{
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                completion(.failure(.invalidURL))
            }
        }*/
        
        // BURDA BİZ PARSE EDİYORUZ HANDLE İLE
        AF.request(url,method: method).responseData { response in
            switch response.result{
            case .success(let data):
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.invalidURL))
            }
        }
        
        
    }
    fileprivate func handleResponse<T:Codable>(data:Data,completion: @escaping ((Result<T,ErrorTypes>)->())) { //tekrar completion deme sebebi hata cıkarsa şu olsun çıkmazsa bu olsun.
        do{
            let results = try JSONDecoder().decode(T.self, from: data)
            completion(.success(results))
        }catch{
            print(error)
        }
    }
}
