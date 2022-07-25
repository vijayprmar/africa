//
//  ContentVIew.swift
//  Africa
//
//  Created by Vijay Parmar on 12/11/21.
//

import SwiftUI

struct ContentVIew: View {
    //MARK:- properties
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
   // let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn:Int = 1
    @State private var toolbarIcon:String = "square.grid.2x2"
    
    //MARK: - Functions
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        
        
    }
    
    
    //MARK:-body
    var body: some View {
        NavigationView{
            
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageVIew()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){ animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListView(animal: animal)
                            }//Link
                        }//Loop
                        CreditsView()
                            .modifier(ContentModifier())
                    }//List
                } else {
                    ScrollView(.vertical,showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center,spacing: 10){
                            ForEach(animals){ animal in
                                
                                NavigationLink(destination:AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                                
                            }//loop
                            
                        }//Grid
                        .padding(10)
                        .animation(.easeIn)
                    }//Scroll
                }//list
            }//Group
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement:  .navigationBarTrailing){
                    HStack(spacing:16){
                        //List Button Action
                        
                        Button(action: {
                             isGridViewActive = false
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            isGridViewActive = true
                            gridSwitch()
                            
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                    }//Hstack
                }//toolbar
            }
        }//Navigation
    }
}

struct ContentVIew_Previews: PreviewProvider {
    static var previews: some View {
        ContentVIew()
    }
}
