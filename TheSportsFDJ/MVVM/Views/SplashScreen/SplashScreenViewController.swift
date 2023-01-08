//
//  SplashScreenViewController.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import UIKit

class SplashScreenViewController: BaseViewController {
    
    // MARK: Private Properties
    
    private var viewModel: SplashScreenViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    private func initViewModel() {
        viewModel = SplashScreenViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.startApp()
    }
}
