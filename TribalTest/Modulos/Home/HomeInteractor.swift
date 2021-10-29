//
//  HomeInteractor.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import Foundation

class HomeInteractor: NSObject, HomeInteractorProtocol {
    
    /// metodo para descargar las imagenes
    
    func dowloadUnSplash(page: Int, completion: @escaping (UnSplashEntity?, CodeResponse?) -> Void) {
        
        ///esta url deberia estar guardada en un archivo de constantes, asii tambien el token
        let urlString = "https://api.unsplash.com/search/?page=\(page)&query=office&client_id=vXnmh05N0GWTk3jLYeZ5u8g5eg6-nQ_7RlmAohTZc7Q"
        
        RequestManager.make(url: urlString, metodo: .get, completion:  { (data:UnSplashEntity?, code) in
            
            switch code {
            case .ok:
                completion(data, nil)
                break
            case .not_connection:
                completion(nil, code)
                break
            case .none:
                completion(nil, code)
                break
            case .some(_):
                completion(nil, code)
                break
            }
            
        })
        
    }
    
    
}
