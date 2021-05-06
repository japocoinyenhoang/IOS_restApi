//
//  Usuario.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import Foundation



//estructura de la informacion cogido del json
/* {
    "code": 200,
    "meta": null,
    "data": {
        "id": 14,
        "name": "Gov. Aagneya Singh",
        "email": "gov_singh_aagneya@rau-gleason.biz",
        "gender": "Female",
        "status": "Inactive",
        "created_at": "2021-05-06T03:50:03.683+05:30",
        "updated_at": "2021-05-06T03:50:03.683+05:30"
    }
}*/

// creo una estructura para configurar el objeto a recibir

struct usuarioRespuesta: Decodable {
    let code: Int?
    let meta: META?
    let data: Usuario?
}
struct Usuario: Decodable {

    let id: Int?
    let nombre: String?
    let email: String?
    let sexo: String?
    let estado: String?
    let fechaCreacion: Date?
    let fechaModificada: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre = "name"
        case email
        case sexo = "gender"
        case estado = "status"
        case fechaCreacion = "created_at"
        case fechaModificada = "updated_at"
    }
}
struct META: Decodable {
    //null
}
