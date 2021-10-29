//
//  ContracsSplash.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

///View Protocols

protocol SplashViewProtocol: UIViewController  {
    
    var presenter: SplashPresenterProtocol? { get set}
    
}


/// Presenter Protocols

protocol SplashPresenterProtocol: NSObject {
    var view: SplashViewProtocol? { get set}
    var interactor: SplashInteractorProtocol? { get set }
    var router: SplashRouterProtocol? { get set }
    
    func goToHome()
}


/// Interactor Protocols

protocol SplashInteractorProtocol: NSObject {
    
}

/// Router Interactor

protocol SplashRouterProtocol: NSObject {
    var presenter: SplashPresenterProtocol? { get set}
    
    static func CreateSplash() -> UIViewController
}

