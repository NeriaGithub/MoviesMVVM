//
//  WebService.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation
import Alamofire

enum WebServiceError:Error {
    case apiError
}

struct WebService {
    static func getRequest<T:Decodable>(stringURL:String = "https://api.androidhive.info/json/movies.json", completion:@escaping (Result<T,WebServiceError>) ->()){
        guard let url = URL(string: stringURL) else { return}
        AF.request(url).response { (response) in
            if let data = response.data{
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodeData))
                } catch  {
                    completion(.failure(.apiError))
                }
            }else{
                completion(.failure(.apiError))
            }
        }
    }
}
