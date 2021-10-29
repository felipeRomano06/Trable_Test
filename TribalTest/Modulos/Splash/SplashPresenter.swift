//
//  SplashPresenter.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

class SplashPresenter: NSObject, SplashPresenterProtocol {
    
    weak var view: SplashViewProtocol?
    
    var interactor: SplashInteractorProtocol?
    
    var router: SplashRouterProtocol?
    
    
    /// metodo para llamar el route de pantalla VC
    func goToHome(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired
            self.view?.present(HomeRouter.CreateHome(), animated: true)
        
        }
    }

    
}

