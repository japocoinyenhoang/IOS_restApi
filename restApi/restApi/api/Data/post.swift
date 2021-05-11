//
//  post.swift
//  restapi
//
//  Created by Tardes on 10/5/21.
//

import Foundation



struct postRespuesta: Decodable {
    let code:Int?
    let meta: MetaPost?
    let data: [Post]?
}
struct Post: Decodable {
    let id: Int
    let user_id:Int
    let title:String
    let body:String
    let created_at:Date
    let updated_at:Date
}

struct MetaPost: Decodable {
    struct pagination : Decodable {
        let total : Int
        let pages: Int
        let page: Int
        let limit: Int
    }
    
}

/*
 {
         "id":40,
         "user_id":38,
         "title":"Baiulus deripio architecto tabernus viridis  sed.",
         "body":"Tribuo aufero arceo. Undique charisma commTamdiu iste agnitio.",
         "created_at":"2021-05-10T03:50:04.772+05:30",
         "updated_at":"2021-05-10T03:50:04.772+05:30"
      },
 
 "meta":{
     "pagination":{
        "total":1311,
        "pages":66,
        "page":1,
        "limit":20
     }
 
 
 
 */
