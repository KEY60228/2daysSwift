//
//  ContentView.swift
//  SwiftTimer
//
//  Created by 山口健太 on 2021/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
            }
            .navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
                Text("秒数設定")
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
