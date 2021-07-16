//
//  ContentView.swift
//  MyFirstSwift
//
//  Created by 山口健太 on 2021/07/15.
//

import SwiftUI

struct ContentView: View {

    @State var outputText = "Hello, World!"

    var body: some View {
        VStack {
            Text(outputText)
                .font(.largeTitle)
                .padding()
            Button(action: {
                outputText = "Hi, Swift!"
                print("デバッグテスト")
                print(outputText)
            }) {
                Text("切り替えボタン")
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
