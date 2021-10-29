//
//  Descarga.swift
//  myfullviper
//
//  Created by Ernesto PG on 10/12/20.
//

import Foundation
import UIKit
import Alamofire


class RequestManager:NSObject{
    
    typealias Metodo = HTTPMethod
    
    /// crea un request generico con la información proporcionada
    /// - Parameter url: Url a la cual se le hara la petición
    /// - Parameter metodo: Selección de metodo HTTP por utilizar
    /// - Parameter parametros: Contenido que llevara la petición en caso de ser nil no tendra contenido, default nil
    /// - Parameter tipoResultado: Tipo de encodable utilizado para la respuesta, en caso de ser nil, se regresara un success con contenido vacio, default nil
    
    static func make<A:Encodable, T:Codable>(url:String, metodo:Metodo, parametros:A?, headers: [String:String]? = nil, completion: @escaping (T?,CodeResponse?) -> ()){
        
        // valida que la url tenga un formato correcto
        guard let urlForRequest = URL(string: url) else {
            print("WRONG URL \(url)")
            completion(nil,CodeResponse.bad_url)
            return
        }
        
        // valida si hay acceso a internet
        guard NetworkReachabilityManager()!.isReachable else {
            completion(nil,CodeResponse.not_connection)
            return
        }
        
        
        // configura url para hacer peticion
        var urlRequest:URLRequest = URLRequest(url: urlForRequest)
        urlRequest.httpMethod = metodo.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.timeoutInterval = 35
        
        for header in headers ?? [:]{
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if metodo != .get {
            if let contenido = parametros {
                urlRequest.httpBody = try? JSONEncoder().encode(contenido)
            }
        }
        
        
        // Realiza peticion
        AF.request(urlRequest).responseData { (data) in
            
            switch data.result {
            case .success:
                guard let response = data.response, let value = data.data else {
                    
                    completion(nil,CodeResponse.unknow)
                    
                    return
                }
                
                let code = CodeResponse(rawValue: response.statusCode) ?? CodeResponse.unknow
                if code == .unknow { print("Code not implemented \(response.statusCode)") }
                if (code == .ok) || (code == .content){
                    do {
                        let obj = try JSONDecoder().decode(T.self, from: value)
                        completion(obj,code)
                    }
                    catch let jsonError{
                        print("Falied to decode Json: ",jsonError)
                        completion(nil,.bad_decodable)
                    }
                } else {
                    print("Some code \(response.statusCode)")
                    let obj = try? JSONDecoder().decode(T.self, from: value)
                    completion(obj,code)
                    
                }
            case .failure:
                completion(nil,.unknow)
                
            }
        }
        
    }
    
    static func make<T:Codable>(url:String,metodo:Metodo,headers: [String:String]? = nil,completion: @escaping (T?,CodeResponse?)-> ()){
        let c : DummyCodable? = nil
        self.make(url: url, metodo: metodo, parametros: c, headers: headers, completion:  completion)
    }
}


/// Codigos de errores de respuestas de servicios
public enum CodeResponse: Int {
    case ok = 200
    case content = 201
    case accepted = 202
    case none_content = 204
    case bad_gain = 206
    case bad_request = 400
    case authentication_failed = 401
    case user_suspend = 402
    case forbidden = 403
    case not_found = 404
    case not_acceptable = 406
    case conflict = 409
    case precondition_failed = 412
    case travel_progress = 416
    case pendent_rent = 417
    case failed_dependency = 424
    case locked = 423
    case car_disable = 428
    case server_error = 500
    case unknow = 520
    case not_connection = 106
    case bad_url = -1
    case bad_decodable = -2
    case not_implemented = -3
   
}

class DummyCodable: Encodable,Decodable{}


struct Response <T:Codable>: Codable
{
    
    var data: T?
    
    enum CodingKeys: String, CodingKey
    {
        case data = "data"
    }
}
