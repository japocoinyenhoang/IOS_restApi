//
//  NuevoUsuario.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import Foundation

struct NuevoUsuario: Encodable{
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}
