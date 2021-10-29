//
//  HomeRouter.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

class HomeRouter: NSObject, HomeRouterProtocol {
    var presenter: HomePresenterProtocol?
    
    static func CreateHome() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let presenter: HomePresenterProtocol = HomePresenter()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let router:  HomeRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        router.presenter = presenter
        
        return view
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: Bundle.main)
    }
}
