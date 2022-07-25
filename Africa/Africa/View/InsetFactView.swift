//
//  InsetFactView.swift
//  Africa
//
//  Created by Vijay Parmar on 14/11/21.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal : Animal
    
    var body: some View {
        
        GroupBox{
            
            TabView{
                ForEach(animal.fact,id: \.self){ item in
                    Text(item)
                }

            }//tabs
            .tabViewStyle(PageTabViewStyle())
          //  .frame(minHeight: 148, idealHeight: 168, maxHeight:100)
        }//group
        
        
    }//Body
}

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
