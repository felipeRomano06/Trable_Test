//
//  SplashViewController.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import UIKit

class SplashViewController: UIViewController, SplashViewProtocol {

    var presenter: SplashPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.goToHome()
    }
    

}
