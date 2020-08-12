//
//  BaseView.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 12/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

protocol IBaseView {
    func showError(msg: String)
}

class BaseView: IBaseView {
    func showError(msg: String = "Ooops an error has occurred") {
        
    }
}
