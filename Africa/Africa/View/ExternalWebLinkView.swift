//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Vijay Parmar on 18/11/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal :Animal
    
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                
                Text("Wekipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    if let url = URL(string: animal.link){
                        Link(animal.name,destination: url)
                    }
                    
                }
            }
        }//:Box
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
