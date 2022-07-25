//
//  ContentModifier.swift
//  Africa
//
//  Created by Vijay Parmar on 18/05/22.
//

import SwiftUI

struct ContentModifier:ViewModifier{
    
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
    
}
