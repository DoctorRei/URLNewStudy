//
//  NetworkManager.swift
//  URLNewStudy
//
//  Created by Акира on 15.01.2024.
//

import Foundation

protocol INetworkManager {
    func fetch<T:Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)
    func downloadImage(with url: String, completion: @escaping(Data) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case DecodingError
}

final class NetworkManager: INetworkManager {
    func fetch<T:Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
       
        
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data else {
                    completion(.failure(.noData))
                    print(error?.localizedDescription ?? "no error description")
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let dataModel = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(dataModel))
                    }
                } catch {
                    completion(.failure(.DecodingError))
                }
            }.resume()
        
    }
    
    func downloadImage(with url: String, completion: @escaping (Data) -> Void) {
        guard let convertedURL = URL(string: url) else {return}
        DispatchQueue.main.async {
            guard let imageData = try? Data(contentsOf: convertedURL) else { return}
            completion(imageData)
        }
            
    }
}
