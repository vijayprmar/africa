//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Vijay Parmar on 14/11/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    var animal :Animal
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment:.center,spacing: 20){
                //hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor.frame(height: 6)
                            .offset(y:40)
                            
                    )
                
                //Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                
                //facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                //description
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Park")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                
                //link
                Group{
                    HeadingView(headingImage: "books.verticle", headingText: "Learn more")
                    ExternalWebLinkView(animal: animal)
                }
                
                
            }//:Vstack
            .navigationBarTitle("Learn More about \(animal.name)",displayMode: .inline)
        }//:Scrollview
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal:animals[0])
        }
        
    }
}
