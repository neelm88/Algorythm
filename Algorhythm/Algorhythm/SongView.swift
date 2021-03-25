//
//  SongView.swift
//  Algorhythm
//
//  Created by Dan Bellini on 2/9/21.
//

import Foundation
import SwiftUI

struct SongView : View {
    
    @State var song : SongInfo
    @State var imageViews : [ImageView] = []
    @State var isOnAppear = false
    
    @EnvironmentObject var addedSong : AddedSong
    
    @ObservedObject var audioRecorder: AudioRecorder
    
    
    
    
    var body: some View{
        ScrollView(.vertical){
            VStack(alignment: .leading){
                Text(song.name)
                    .font(.title)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text(song.artist)
                    .font(.subheadline)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                if isOnAppear{
                    PageView(pages: imageViews)
                        .aspectRatio(contentMode: .fit)
                }
            }.onAppear(perform: {
                for data in self.song.photo{
                    imageViews.append(ImageView(image:  UIImage(data: data)!))
                }
                self.isOnAppear = true
            })
            VStack{
                if audioRecorder.recording == false {
                    Button(action: {audioRecorder.startRecording()}, label: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    })
                }else{
                    Button(action: {audioRecorder.stopRecording()}, label: {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    })
                }
            }
        }
        
    }
}
