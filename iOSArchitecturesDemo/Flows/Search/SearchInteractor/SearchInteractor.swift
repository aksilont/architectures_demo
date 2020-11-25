//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 23.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Alamofire

protocol SearchInteractorInput {
//    func requestData(with query: String, type: ContentType, completion: @escaping (Result<[AnyObject]>) -> Void)
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}


final class SearchInteractor: SearchInteractorInput {
    private let networkService = ITunesSearchService()
    
//    func requestData<T>(with query: String, type: ContentType, completion: @escaping (Result<[T]>) -> Void) {
//        switch type {
//        case .app:
//            networkService.getApps(forQuery: query, then: completion)
//        case .song:
//            networkService.getSongs(forQuery: query, then: completion)
//        }
//    }
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        networkService.getApps(forQuery: query, then: completion)
    }

    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        networkService.getSongs(forQuery: query, then: completion)
    }
}
