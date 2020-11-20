//
//  AppDetailDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by Sky on 18.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailDescriptionView: UIView {
    
    private(set) lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Что нового"
        return label
    }()
    
    private(set) lazy var historyVersionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версий", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .right
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 5
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
        addSubview(whatsNewLabel)
        addSubview(historyVersionButton)
        addSubview(versionLabel)
        addSubview(dateLabel)
        addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            whatsNewLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            whatsNewLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            whatsNewLabel.widthAnchor.constraint(equalToConstant: 150.0),
            
            historyVersionButton.topAnchor.constraint(equalTo: whatsNewLabel.topAnchor),
            historyVersionButton.leftAnchor.constraint(equalTo: whatsNewLabel.rightAnchor),
            historyVersionButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            versionLabel.topAnchor.constraint(equalTo: whatsNewLabel.bottomAnchor, constant: 16.0),
            versionLabel.leftAnchor.constraint(equalTo: whatsNewLabel.leftAnchor),
            versionLabel.widthAnchor.constraint(equalToConstant: 150.0),
            
            dateLabel.topAnchor.constraint(equalTo: versionLabel.topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: versionLabel.rightAnchor),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16.0),
            descriptionLabel.leftAnchor.constraint(equalTo: versionLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0)
        ])
    }
    
}
