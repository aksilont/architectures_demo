//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 23.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}


final class SearchInteractor: SearchInteractorInput {
    private let networkService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        networkService.getApps(forQuery: query, then: completion)
    }
    
}
