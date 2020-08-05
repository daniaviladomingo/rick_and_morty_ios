//
//  CharacterViewCell.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 05/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class CharacterViewCell: UITableViewCell {
    var character: Character? {
        didSet {
            imageCharacter.load(url: URL(string: character!.image)!)
            name.text = character!.name
        }
    }
    
    let imageCharacter: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let name:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imageCharacter)
        self.contentView.addSubview(name)
        
        imageCharacter.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        imageCharacter.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        imageCharacter.widthAnchor.constraint(equalToConstant:70).isActive = true
        imageCharacter.heightAnchor.constraint(equalToConstant:70).isActive = true
//        containerView.addSubview(nameLabel)
//        containerView.addSubview(jobTitleDetailedLabel)
//        self.contentView.addSubview(containerView)
//        self.contentView.addSubview(countryImageView)
//
//        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
//        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
//
//        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
//        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
//        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
//
//        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
//
//        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
//        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
//        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
//
//        countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
//        countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
//        countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
//        countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
