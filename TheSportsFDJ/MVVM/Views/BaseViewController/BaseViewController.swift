//
//  BaseViewController.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    
    var loadingHelper: LoadingHelper!
    var baseViewModel = BaseViewModel()
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingHelper = LoadingHelper(self)
        self.view.bringSubviewToFront(loadingHelper.loader)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
