//
//  GallaryView.swift
//  Africa
//
//  Created by Vijay Parmar on 12/11/21.
//

import SwiftUI

struct GallaryView: View {
    
    //MARK: - Properties
    
    @State private var selectedAnimal : String = "lion"
    let animals:[Animal] = Bundle.main.decode("animals.json")
    
    //MARK: - Simple Grid Definititon
//    let gridLayout:[GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout :[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Double = 3.0
    
 
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 30) {
                
                //MARK:- Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                //MARK:- Slider
                
                Slider(value: $gridColumn, in: 2...4,step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                //Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals){ item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }
                    }
                    
                }//Grid
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }//Stack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }// Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
    
    
}

struct GallaryView_Previews: PreviewProvider {
    static var previews: some View {
        GallaryView()
    }
}
