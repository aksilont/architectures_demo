//
//  AppDetailDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 18.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionViewController: UIViewController {
    
    //MARK: - Properties
    
    private let app: ITunesApp
    
    private var appDetailDescriptionView: AppDetailDescriptionView {
        return view as! AppDetailDescriptionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = AppDetailDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    private func fillData() {
        appDetailDescriptionView.versionLabel.text = "Версия \(app.version ?? "--")"
        appDetailDescriptionView.dateLabel.text = getDateFromString(app.currentVersionReleaseDate)
        appDetailDescriptionView.descriptionLabel.text = app.releaseNotes
    }
    
    private func getDateFromString(_ dateString: String?) -> String {
        guard let dateString = dateString else { return "---" }
        
//        let isoFormatter = ISO8601DateFormatter()
//        let date = isoFormatter.date(from: dateString)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateString) else {
            return "---"
        }

        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
