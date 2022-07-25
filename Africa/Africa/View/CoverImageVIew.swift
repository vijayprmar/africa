//
//  CoverImageVIew.swift
//  Africa
//
//  Created by Vijay Parmar on 13/11/21.
//

import SwiftUI

struct CoverImageVIew: View {
    //MARK:- Properties
    let coverImages:[CoverImage] = Bundle.main.decode("covers.json")
    //MARK:-body
    var body: some View {
        TabView{
            ForEach(coverImages){ item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()

            }
        }//:tabs
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageVIew()
            .previewLayout(.fixed(width:400,height:300))
    }
}
