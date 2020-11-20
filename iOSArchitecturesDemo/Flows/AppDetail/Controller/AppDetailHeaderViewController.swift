//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {
    
    //MARK: - Properties
    
    private let app: ITunesApp
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailHeaderView: AppDetailHeaderView {
        return view as! AppDetailHeaderView
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
        view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        DownloadImage()
        appDetailHeaderView.titleLabel.text = app.appName
        appDetailHeaderView.subTitleLabel.text = app.company
        appDetailHeaderView.ratingLabel.text = app.averageRating.flatMap { "\($0)" }
    }
    
    private func DownloadImage() {
        guard let url = app.iconUrl else { return }
        imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.appDetailHeaderView.imageView.image = image
            }
        }
    }
    
}
