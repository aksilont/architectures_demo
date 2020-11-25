//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 18.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    var searchResults: [AnyObject] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String, type: ContentType)
    func viewDidSelectApp(app: ITunesApp)
    func viewDidSelectSong(song: ITunesSong)
}

final class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestData(with query: String, type: ContentType) {
        switch type {
        case .app:
            interactor.requestApps(with: query) { [weak self] (result) in
                guard let self = self else { return }
                
                self.viewInput?.throbber(show: false)
                result
                    .withValue { (apps) in
                        guard !apps.isEmpty else {
                            self.viewInput?.showNoResults()
                            return
                        }
                        self.viewInput?.hideNoResults()
                        self.viewInput?.searchResults = apps as [AnyObject]
                    }
                    .withError { (error) in
                        self.viewInput?.showError(error: error)
                    }
            }
        case .song:
            interactor.requestSong(with: query) { [weak self] (result) in
                guard let self = self else { return }
                
                self.viewInput?.throbber(show: false)
                result
                    .withValue { (songs) in
                        guard !songs.isEmpty else {
                            self.viewInput?.showNoResults()
                            return
                        }
                        self.viewInput?.hideNoResults()
                        self.viewInput?.searchResults = songs as [AnyObject]
                    }
                    .withError { (error) in
                        self.viewInput?.showError(error: error)
                    }
            }
        }
        
    }
}

extension SearchPresenter: SearchViewOutput {
    
    func viewDidSearch(with query: String, type: ContentType) {
        viewInput?.throbber(show: true)
        requestData(with: query, type: type)
    }
    
    func viewDidSelectApp(app: ITunesApp) {
        router.openAppDetails(for: app)
    }
    
    func viewDidSelectSong(song: ITunesSong) {
        router.openSongDetails(for: song)
    }
}
