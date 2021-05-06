//
//  restApiProvider.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
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
    
    //añado las peticiones
    //GET de un usuario
    func getUsuario(id: Int)  {
        // preparacion de la url para coger el usuario
        let url = "\(baseURL)users/\(id)"
        //AF hace referencia a la libreria Alamofire
        //llamada basica get, y que la llamada devuelva un valor (codigo del 200 al 299 que he sacado como constante estadoOK
        AF.request(url, method: .get).validate(statusCode: estadoOk).responseDecodable(of: usuarioRespuesta.self, decoder: DateDecoder()) {
            response in
            //comprobar si el usuario existe
            if let usuario = response.value?.data {
                // si tenemos datos del usuario
                print(usuario)
            }else {
                // no tenemos datos del usuario
                print("usuario no encontrado")
            }
        }
    }
}
