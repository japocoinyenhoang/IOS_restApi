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
    //let meta: Meta?
    let data: Usuario?
}
struct Usuario: Decodable {

    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
    let created_at: String
    let updated_at: String
}
