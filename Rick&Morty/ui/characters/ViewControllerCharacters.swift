//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class ViewControllerCharacters: BaseView, IViewCharacters {
    var presenter: IPresenterCharacters?
    
    private let tableView = UITableView()
    private var characters: [Character] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        presenter?.loadCharacters()
    }
    
    func showCharacters(characters: [Character]) {
        self.characters.append(contentsOf: characters)
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
        
        navigationItem.title = "Rick & Morty"
    }
}

extension ViewControllerCharacters: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterViewCell
        
        cell.character = character
        
        if indexPath.row == characters.count-1 {
            presenter?.loadCharacters()
        }
                
        return cell
    }
}

extension ViewControllerCharacters: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showCharacterDetail(id: characters[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
