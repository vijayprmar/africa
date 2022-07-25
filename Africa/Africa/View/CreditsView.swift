//
//  CreditsView.swift
//  Africa
//
//  Created by Vijay Parmar on 18/05/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
            Copyright ©Vijay Parmar
            All Rights Reseved
            """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//Vstck
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
