//
//  LoadingHelper.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Foundation
import UIKit

struct LoadingHelper {
    
    var loader: UIActivityIndicatorView!
    
    init(_ viewController: UIViewController) {
        loader = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        viewController.view.addSubview(loader)
        loader.hidesWhenStopped = true
        loader.style = UIActivityIndicatorView.Style.large
        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.widthAnchor.constraint(equalToConstant: 40),
            loader.heightAnchor.constraint(equalToConstant: 40),
            loader.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor),
            loader.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor)
        ])
    }
    
    func start() {
        loader.startAnimating()
    }
    
    func stop() {
        loader.stopAnimating()
    }
}

