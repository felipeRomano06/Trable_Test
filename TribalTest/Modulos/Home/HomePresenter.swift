//
//  HomePresenter.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation
import UIKit

class HomePresenter: NSObject, HomePresenterProtocol {
    
    
    weak var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    var router: HomeRouterProtocol?
    
    ///metodo para llamar a traer las imagenes
    func callImages(page:Int) {
        //llamar a un loader
        //self.view.loader(true)
        self.interactor?.dowloadUnSplash(page: page, completion: {
            unSplashEntity, code in
            //ocultar loader
            //self.view.loader(false)
            if code == nil {
                if let fotos = unSplashEntity?.photos?.results {
                    self.view?.loadImages(result: fotos)
                }
                
            }
        })
    }
    
}
