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
}
