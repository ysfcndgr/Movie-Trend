//
//  NetworkConstant.swift
//  MovieTrending
//
//  Created by Can on 30.01.2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        
    }
    
    public var apiKey: String {
        get {
            "9b43d79535075386d315b1ffb922202b"
        }
    }
    
    public var serverAddress: String {
        get {
            "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
