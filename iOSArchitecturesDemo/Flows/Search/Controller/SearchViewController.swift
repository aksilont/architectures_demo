//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

enum ContentType: Int {
    case app, song
}

final class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: SearchViewOutput
    
    private var searchView: SearchView {
        return self.view as! SearchView
    }
    
    private var contentType: ContentType = .app
    
    private let searchService = ITunesSearchService()
    var searchResults = [AnyObject]() {
        didSet {
            searchView.tableView.isHidden = false
            searchView.tableView.reloadData()
            searchView.tableView.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifierApp = "reuseIdApp"
        static let reuseIdentifierSong = "reuseIdSong"
    }
    
    //MARK: - Init
    
    init(presenter: SearchViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = SearchView()
        searchView.searchType.addTarget(self, action: #selector(searchTypeChange), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifierApp)
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifierSong)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    @objc func searchTypeChange(_ segmentedControl: UISegmentedControl) {
        contentType = ContentType.init(rawValue: segmentedControl.selectedSegmentIndex) ?? .app
        searchResults = []
        self.searchView.searchBar.text = nil
        searchView.tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType {
        case .app:
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifierApp, for: indexPath)
            guard let cell = dequeuedCell as? AppCell else {
                return dequeuedCell
            }
            let app = self.searchResults[indexPath.row] as! ITunesApp
            let cellModel = AppCellModelFactory.cellModel(from: app)
            cell.configure(with: cellModel)
            return cell
        case .song:
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifierSong, for: indexPath)
            guard let cell = dequeuedCell as? SongCell else {
                return dequeuedCell
            }
            let song = self.searchResults[indexPath.row] as! ITunesSong
            let cellModel = SongCellModelFactory.cellModel(from: song)
            cell.configure(with: cellModel)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch contentType {
        case .app:
            let app = searchResults[indexPath.row] as! ITunesApp
            let appDetaillViewController = AppDetailViewController(app: app)
            appDetaillViewController.app = app
            presenter.viewDidSelectApp(app: app)
        case .song:
            let song = searchResults[indexPath.row] as! ITunesSong
            let songDetaillViewController = SongDetailViewController(song: song)
            songDetaillViewController.song = song
            presenter.viewDidSelectSong(song: song)
        }
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        presenter.viewDidSearch(with: query, type: contentType)
    }
}

//MARK: - SearchViewInput
extension SearchViewController: SearchViewInput {
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
}
