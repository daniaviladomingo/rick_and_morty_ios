//
//  BaseView.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 12/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IBaseView {
    func showError(msg: String)
    func showToast(message : String)
}

class BaseView: UIViewController, IBaseView {
    func showError(msg: String = "Ooops an error has ocurred") {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in }))
        present(alert, animated: true)
    }
    
    func showToast(message : String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.dismiss(animated: true)
        }
    }
}
