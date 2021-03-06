//
//  ContentView.swift
//  SwiftMusic
//
//  Created by 山口健太 on 2021/07/17.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                // セーフエリア外までいっぱいになるように指定
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                // アスペクト比を維持して短編
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)

            HStack {
                Button(action: {
                    soundPlayer.cymbalPlay()
                }) {
                    ButtonImageView(imageName: "cymbal")
                }
                
                Button(action: {
                    soundPlayer.guitarPlay()
                }) {
                    ButtonImageView(imageName: "guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
