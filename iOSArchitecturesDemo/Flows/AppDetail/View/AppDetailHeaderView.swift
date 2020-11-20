//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailHeaderView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        button.backgroundColor = UIColor(white: 0.3, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    
    private func configureUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(openButton)
        addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 120.0),
            imageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            subTitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            openButton.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            openButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24.0),
            openButton.widthAnchor.constraint(equalToConstant: 80.0),
            openButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            ratingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24.0),
            ratingLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
