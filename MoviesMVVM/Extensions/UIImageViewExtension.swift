//
//  UIImageViewExtension.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func load(StringURL:String ) {
        guard let url = URL(string: StringURL) else { return }
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
