//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Vijay Parmar on 26/11/21.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomeCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //MARK:-functions
    
    //1.randome coordinate
    func randomeCoordinate(max:CGFloat)->CGFloat{
        
        return CGFloat.random(in: 0...max)
        
    }
    
    //2.randome size
    func randomeSize()->CGFloat{
        
        return CGFloat.random(in: 0...300)
        
    }
    
    //3.randome Scale
    func randomeScale()->CGFloat{
        return CGFloat.random(in: 0.1...2.0)
    }

    //4.randome speed
    func randomeSpeed()->CGFloat{
        return CGFloat.random(in: 0.025...1.0)
    }
    
    //5.randome delay
    func randomeDelay()->CGFloat{
        return CGFloat.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader {geometry in
            
            ZStack {
                
                ForEach(0...randomeCircle, id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomeSize(), height: randomeSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomeScale() : 1)
                        .position(x:randomeCoordinate(max: geometry.size.width), y: randomeCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .speed(randomeSpeed())
                                .delay(randomeDelay())
                        ).onAppear {
                            isAnimating = true
                        }
                }//Loop
                
            }//:ZStack
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
