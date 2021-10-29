//
//  SplashRouter.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

class SplashRouter: NSObject, SplashRouterProtocol {
    var presenter: SplashPresenterProtocol?
    
    static func CreateSplash() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(identifier: "SplashViewController") as! SplashViewController
        let presenter: SplashPresenterProtocol = SplashPresenter()
        let interactor: SplashInteractorProtocol = SplashInteractor()
        let router:  SplashRouterProtocol = SplashRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        router.presenter = presenter
        
        return view
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Splash", bundle: Bundle.main)
    }
}

