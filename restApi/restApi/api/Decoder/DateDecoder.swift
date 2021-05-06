//
//  DateDecoder.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import Foundation

final class DateDecoder: JSONDecoder {
    
    //creo un objeto de formato fecha
    //DateFormatter() sirve para formatear fechas en diferentes formatos
    let formatoFecha = DateFormatter()
    
    override init() {
        super.init()
        //referencia de como viene en el JSON "2021-05-06T03:50:03.683+05:30"
        //SSSXXX decimas de segundo y desfase horario
        formatoFecha.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        
        //aplico la estraategia definida para esta fecha
        dateDecodingStrategy = .formatted(formatoFecha)
    }
}
