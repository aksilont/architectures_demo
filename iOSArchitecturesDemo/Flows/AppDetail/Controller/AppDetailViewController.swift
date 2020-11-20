//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var descriptionViewController = AppDetailDescriptionViewController(app: app)
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white;
        navigationItem.largeTitleDisplayMode = .never
        
        addHeaderVC()
        addDescriptionVC()
    }
    
    private func addHeaderVC() {
        addChild(headerViewController)
        view.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func addDescriptionVC() {
        descriptionViewController.view.backgroundColor = .systemPink
        addChild(descriptionViewController)
        view.addSubview(descriptionViewController.view)
        descriptionViewController.didMove(toParent: self)
        
        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor, constant: 10),
            descriptionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            descriptionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }
}
