//
//  ContentView.swift
//  MyFirstSwift
//
//  Created by 山口健太 on 2021/07/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hi, Swift!")
                .font(.largeTitle)
                .padding()
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("切り替えボタン")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
