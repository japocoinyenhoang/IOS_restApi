//
//  restApiProvider.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//  https://gorest.co.in/
//

import Foundation  // libreria que lleva lo principal de ios
import Alamofire    //llamo a la libreria que he instalado

//añado la clase final para que sea una clase unica dentro de mi aplicacion

final class restApiProvider {
    
    // variable recursiva para que la clase se pueda compartir durante en toda mi aplicacion
    static let shared = restApiProvider()
    
    private let baseURL =
       "https://gorest.co.in/public-api/"
    private let estadoOk = 200...299
    private let TOKEN = "4f0b15144cb50d49fbea658f040cc89fd1896c3040d1c6b8a1bfd7b67c89941a"
    
    //añado las peticiones
    //GET de un usuario
    // el _ es para pasarle el dato de forma oculta
    
    //GET de un usuario
    func getUsuario(id: Int, success: @escaping (_ usuario: Usuario) ->(), failure: @escaping (_ error: Error?) ->()) {
        
        // preparacion de la url para coger el usuario
        let url = "\(baseURL)users/\(id)"
        
        //AF hace referencia a la libreria Alamofire
        //llamada basica get, y que la llamada devuelva un valor (codigo del 200 al 299 que he sacado como constante estadoOK
        AF.request(url, method: .get).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self, decoder: DateDecoder()) {
            response in
            //comprobar si el usuario existe
            if let usuario = response.value?.data {
                success(usuario)
                // si tenemos datos del usuario
                /*print(usuario)
                print(usuario.nombre!)
                print(usuario.email!)*/
            }else {
                // no tenemos datos del usuario
                failure(response.error)
                
            }
        }
    }
    
    
    // POST Añadir un usuario
    func postUsuario(usuario: NuevoUsuario, success: @escaping (_ usuario: Usuario) ->(), failure: @escaping (_ error: Error?) ->()) {
        
        // preparacion de la url para añadir un usuario
        let url = "\(baseURL)users"
        
        //preparación cabecera con token
        let headers: HTTPHeaders = [.authorization(bearerToken: TOKEN)]
        
        //AF hace referencia a la libreria Alamofire
        //llamada basica post, y que la llamada devuelva un valor (codigo del 200 al 299 que he sacado como constante estadoOK
        AF.request(url, method: .post, parameters: usuario).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self, decoder: DateDecoder()) {
            response in
            //comprobar si el usuario existe
            if let usuario = response.value?.data {
                success(usuario)
                // si tenemos datos del usuario
                /*print(usuario)
                print(usuario.nombre!)
                print(usuario.email!)*/
            }else {
                // no tenemos datos del usuario
                failure(response.error)
                
            }
        }
        
    }
    
    //PUT PACH Modificar un usuario
    func putupdateUsuario(id: Int, usuario: NuevoUsuario,success: @escaping (_ usuario: Usuario) -> (), failure: @escaping (_ error: Error?) -> ()) {
    
        let url = "\(baseURL)users/\(id)"
        
        //preparación cabecera con token
        let headers: HTTPHeaders = [.authorization(bearerToken: TOKEN)]
        
        //lamada basica post
        AF.request(url,
                   method: .put,
                   parameters: usuario,
                   encoder: JSONParameterEncoder.default,
                   headers: headers
                   ).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self, decoder: DateDecoder()) { response in
            
            //comprobar si el usuario existe
            if let usuario = response.value?.data {
                //si tenemos datos del usuario
                
                success(usuario)
                
                
            } else {
                //no tenemos datos del usuario
                failure(response.error)
            }
            
        }
        
    
    }
    
    //DELETE borrar un usuario
    func deleteUsuario(id: Int,success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()) {
    
        let url = "\(baseURL)users/\(id)"
        
        //preparación cabecera con token
        let headers: HTTPHeaders = [.authorization(bearerToken: TOKEN)]
        
        //lamada basica post
        AF.request(url,
                   method: .delete,
                   headers: headers
                   ).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self) { response in
            
            //comprobar si el usuario existe
             if let error = response.error {
                //en caso error al borrar
                
                failure(error)

            } else {
                //en caso de que si borre
                success()
            }
        }

    }
    
    //GET de POST
   /* func getPosts(success: @escaping (_ posts: [Post]) -> (), failure: @escaping (_ error: Error?) -> ()) {
    
        let url = "\(baseURL)users/\(id)"
        
        //preparación cabecera con token
        let headers: HTTPHeaders = [.authorization(bearerToken: TOKEN)]
        
        //lamada basica post
        AF.request(url,
                   method: .delete,
                   headers: headers
                   ).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self) { response in
            
            //comprobar si el usuario existe
             if let error = response.error {
                //en caso error al borrar
                
                failure(error)

            } else {
                //en caso de que si borre
                success()
            }
            
        }
        
    
    }*/
    
}
