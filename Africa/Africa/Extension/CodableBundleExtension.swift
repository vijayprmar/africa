//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Vijay Parmar on 13/11/21.
//

import Foundation

extension Bundle{
    func decode<T:Codable>(_ file:String)->T{
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil )else {fatalError("Failed to locate file in bundle.") }
        
        //2. Create the property for data
        guard let data = try? Data(contentsOf: url)else {fatalError("Failed to locate file in bundle.") }
        
        //3. Create  decoder
        let decoder = JSONDecoder()
        
        //4. Create the property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failded to decode")
        }
        
        //5. return to ready to use data
        return loaded
    
    }
}
