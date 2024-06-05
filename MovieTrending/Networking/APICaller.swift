//
//  APICaller.swift
//  MovieTrending
//
//  Created by Can on 30.01.2024.
//

import Foundation

enum NetworkError: Error{
    case urlError
    case canNotParseData
    case canNotGetData
    case canNotConvert
    case networkError
    case httpError
    case invalidResponseFormat
}

public class APICaller {
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> ()) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                // Handle network error
                completionHandler(.failure(.networkError))
                return
            }
            
            // Check HTTP response status code
            guard let httpResponse = response as? HTTPURLResponse else {
                // Handle missing HTTP response
                completionHandler(.failure(.httpError))
                return
            }
            
            if !(200..<300).contains(httpResponse.statusCode) {
                // Print or log the HTTP status code for debugging purposes
                print("HTTP Status Code: \(httpResponse.statusCode)")
                
                // Handle non-success HTTP status code
                completionHandler(.failure(.httpError))
                return
            }
            
            // Check Content-Type of the response
            guard let contentType = httpResponse.allHeaderFields["Content-Type"] as? String, contentType.contains("application/json") else {
                // Handle non-JSON response
                completionHandler(.failure(.invalidResponseFormat))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieModel.self, from: data)
                completionHandler(.success(results))
            } catch {
                print(error)
                completionHandler(.failure(.canNotConvert))
            }
        }
        
        task.resume()
    }
}

