//
//  ContentView.swift
//  SwiftMap
//
//  Created by 山口健太 on 2021/07/19.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchKey: String = ""
    @State var dispMapType: MKMapType = .standard
    
    var body: some View {
        VStack {
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                dispSearchKey = inputText
                print("入力したキーワード: " + dispSearchKey)
            })
                .padding()

            ZStack (alignment: .bottomTrailing) {
                MapView(searchKey: dispSearchKey, mapType: dispMapType)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

