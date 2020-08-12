//
//  ViewControllerFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class ViewControllerEditFavorite: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, IViewEditFavorite {
    var id: Int!
    var character: Character!
    
    var presenter: IPresenterEditFavorite?
    
    private let statusValuesPicker = ["ALIVE", "DEAD", "UNKNOWN"]
    
    let imageCharacter: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let name: UITextField = {
        let label = UITextField()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let origin: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let species: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let status: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        presenter?.loadCharacter(id: id)
    }
    
    func showFavorite(character: Character) {
        self.character = character
        
        name.text = character.name
        origin.text = character.origin
        species.text = character.species
        
        let indexPicker: Int = {
            switch character.status {
            case .ALIVE:
                return 0
            case .DEAD:
                return 1
            case .UNKNOWN:
                return 2
            }
        }()
        
        status.selectRow(indexPicker, inComponent: 0, animated: true)
        imageCharacter.load(url: URL(string: character.image)!)
    }
        
    private func buildUI() {
        view.backgroundColor = .white
        
        view.addSubview(imageCharacter)
        view.addSubview(name)
        view.addSubview(origin)
        view.addSubview(species)
        view.addSubview(status)
        
        status.delegate = self
        status.dataSource = self
        
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .fill // .Leading .FirstBaseline .Center .Trailing .LastBaseline
//        stackView.distribution = .fill // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
//
//        stackView.addSubview(origin)
//        stackView.addSubview(species)
//
//        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageCharacter.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            imageCharacter.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageCharacter.widthAnchor.constraint(equalToConstant: 200),
            imageCharacter.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            name.bottomAnchor.constraint(equalTo: imageCharacter.topAnchor, constant: -20),
            name.centerXAnchor.constraint(equalTo: imageCharacter.centerXAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 20),
//            stackView.centerXAnchor.constraint(equalTo: imageCharacter.centerXAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            origin.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 20),
            origin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            species.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 20),
            species.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            status.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 20),
            status.centerXAnchor.constraint(equalTo: imageCharacter.centerXAnchor)
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeFavorite))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(updateFavorite))
    }
    
    @objc private func removeFavorite() {
        presenter?.removeFromFavorite(id: id)
        dismiss(animated: true)        
    }
    
    @objc private func updateFavorite() {
        let statusVal =  Status.init(rawValue: statusValuesPicker[status.selectedRow(inComponent: 0)])!
        
        let updateCharacter = Character(id: self.id, name: name.text!, image: self.character.image, status: statusVal, species: species.text!, origin: origin.text!)
        
        presenter?.updateCharacter(character: updateCharacter)
        dismiss(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusValuesPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return statusValuesPicker[row]
    }
}
