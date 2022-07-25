//
//  VideoModel.swift
//  Africa
//
//  Created by Vijay Parmar on 19/11/21.
//

import Foundation

struct Video:Codable,Identifiable{
    
    let id:String
    let name:String
    let headline:String
    
    
    //Computed property
    
    var thumbnail:String{
        "video-\(id)"
    }
}
