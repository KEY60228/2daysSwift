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
            VStack {
                Text("タイマー画面")
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
