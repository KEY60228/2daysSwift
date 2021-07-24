//
//  ContentView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                
            }) {
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
