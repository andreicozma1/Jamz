//
//  ContentView.swift
//  MyFirstIOSApp
//
//  Created by Andrei Cozma on 4/30/20.
//  Copyright © 2020 Andrei Cozma. All rights reserved.
//

import SwiftUI
import MediaPlayer

let musicPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer;
let genres = ["Rock","Blues","Metal","Blues","Alternative","Pop","Hip-Hop/Rap"]

func playGenre(genre: String){
    
    let query = MPMediaQuery();
    let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
    query.addFilterPredicate(predicate)
    
    musicPlayer.setQueue(with: query)

    musicPlayer.play()
}

struct ContentView: View {
    
    @State private var isPlaying = -1;
    @State private var lastPlayed = -1;
    
    
    var body: some View {
        
        
        VStack(){
            Text("Jamz").bold().foregroundColor(.red).font(.custom("Zapfino", size: 70)).padding(.bottom,-30).padding(.bottom,-100)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 15, content:  {
                
                Button(action: {
                    print("Playing " + genres[0])
                    self.isPlaying = 0;
                    playGenre(genre: genres[0])
                }) {
                    Text(genres[0]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 0 ? 0.5 : 1)
                    
                    .background(Color.accentColor)
                
                Button(action: {
                    print("Playing " + genres[1])
                    self.isPlaying = 1;
                    playGenre(genre: genres[1])
                }) {
                    Text(genres[1]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 1 ? 0.5 : 1.0)
                    
                    .background(Color.accentColor)
                
                Button(action: {
                    print("Playing " + genres[2])
                    self.isPlaying = 2;
                    playGenre(genre: genres[2])
                }) {
                    Text(genres[2]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 2 ? 0.5 :1.0)
                    
                    .background(Color.accentColor)
                
                Button(action: {
                    print("Playing " + genres[3])
                    self.isPlaying = 3;
                    playGenre(genre: genres[3])
                }) {
                    Text(genres[3]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 3 ? 0.5 :1.0)
                    
                    .background(Color.accentColor)
                
                Button(action: {
                    print("Playing " + genres[4])
                    self.isPlaying = 4;
                    playGenre(genre: genres[4])
                }) {
                    Text(genres[4]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 4 ? 0.5 :1.0)
                    
                    .background(Color.accentColor)
                
                
                Button(action: {
                    print("Playing " + genres[5])
                    self.isPlaying = 5;
                    playGenre(genre: genres[5])
                }) {
                    Text(genres[5]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 5 ? 0.5 :1.0)
                    
                    .background(Color.accentColor)
                
                Button(action: {
                    print("Playing " + genres[6])
                    self.isPlaying = 6;
                    playGenre(genre: genres[6])
                }) {
                    Text(genres[6]).fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 30, maxHeight: 45)
                }.opacity(isPlaying == 6 ? 0.5 :1.0)
                    .background(Color.accentColor)
                
            })
            
            Spacer()
            
            HStack(content: {
                Spacer()
                Button(action: {
                    print("Start")
                    if(self.lastPlayed == -1){
                        print("Nothing to start. Select a genre above!");
                    } else{
                        self.isPlaying = self.lastPlayed;
                        musicPlayer.play()
                    }
                    
                }){
                    Text("Start").fontWeight(.bold).font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 50, maxWidth: 100, minHeight: 30, maxHeight: 45)
                    
                    
                    
                }.opacity(isPlaying == -1 ? 1.0 : 0.5)
                    .background(Color.green)
                    .cornerRadius(25)
                    .disabled(isPlaying == -1 ? false : true)
                
                Spacer()
                Button(action: {
                    print("Stop")
                    self.lastPlayed = self.isPlaying;
                    if(self.isPlaying == -1){
                        print("Already stopped")
                    } else{
                        self.isPlaying = -1;
                        musicPlayer.pause()
                    }
                    
                }){
                    Text("Stop").fontWeight(.bold).font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 50, maxWidth: 100, minHeight: 30, maxHeight: 45)
                    
                }.opacity(isPlaying == -1 ? 0.5 : 1.0)
                    .background(Color.red)
                    .cornerRadius(25)
                    .disabled(isPlaying == -1 ? true : false)
                
                Spacer()
                
            })
        }.padding(.bottom,20)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
