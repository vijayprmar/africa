//
//  VideoListView.swift
//  Africa
//
//  Created by Vijay Parmar on 12/11/21.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos :[Video] = Bundle.main.decode("videos.json")
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }//list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        videos.shuffle()
                    })
                    {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
