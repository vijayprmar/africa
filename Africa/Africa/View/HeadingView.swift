//
//  HeadingView.swift
//  Africa
//
//  Created by Vijay Parmar on 14/11/21.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage :String
    var headingText :String
    
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
    
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildness in picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
