//
//  extension.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 05/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
