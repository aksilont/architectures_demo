//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 23.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openAppDetails(for app: ITunesApp)
    func openAppInITunes(_ app: ITunesApp)
    func openSongDetails(for song: ITunesSong)
}

final class SearchRouter: SearchRouterInput {
    weak var viewController: UIViewController?
    
    func openAppDetails(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInITunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openSongDetails(for song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}
