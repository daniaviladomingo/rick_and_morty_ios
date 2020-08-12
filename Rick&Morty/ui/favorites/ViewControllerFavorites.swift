//
//  FavoriteViewController.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class ViewControllerFavorites: UIViewController, IViewFavorites {
    var presenter: IPresenterFavorites?
    
    private let tableView = UITableView()
    private var characters: [Character]?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        buildUI()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadFavorites()
    }
    
    func showFavorites(characters: [Character]) {
        self.characters = characters
        tableView.reloadData()
    }
    
    private func buildUI() {
        view.backgroundColor = .white
        definesPresentationContext = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "Favorites"
    }
}

extension ViewControllerFavorites: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let character = characters?[indexPath.row] else { return CharacterViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterViewCell
        
        cell.character = character
                
        return cell
    }
}

extension ViewControllerFavorites: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let character = characters?[indexPath.row] {
            presenter?.editFavorite(id: character.id)
        }        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
