//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 22.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white;
        navigationItem.largeTitleDisplayMode = .never
    }
}
