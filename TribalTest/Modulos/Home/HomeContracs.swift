//
//  HomeContracs.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

///View Protocols

protocol HomeViewProtocol: UIViewController  {
    
    var presenter: HomePresenterProtocol? { get set}
    
    func loadImages(result: [Result])
    
}


/// Presenter Protocols

protocol HomePresenterProtocol: NSObject {
    var view: HomeViewProtocol? { get set}
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    
    func callImages(page:Int)
}


/// Interactor Protocols

protocol HomeInteractorProtocol: NSObject {
    func dowloadUnSplash(page:Int, completion: @escaping (UnSplashEntity?, CodeResponse?) -> Void)
}

/// Router Interactor

protocol HomeRouterProtocol: NSObject {
    var presenter: HomePresenterProtocol? { get set}
    
    static func CreateHome() -> UIViewController
}


