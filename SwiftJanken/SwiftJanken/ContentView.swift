//
//  ContentView.swift
//  SwiftJanken
//
//  Created by 山口健太 on 2021/07/16.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber: Int = 0
    
    var body: some View {
        VStack {
            // グーの画像を配置
            Image("gu")
                // リサイズ
                .resizable()
                // アスペクト
                .aspectRatio(contentMode: .fit)
            Text("グー")
            Button(action: {
                print("タップされたよ！")
            }) {
                Text("じゃんけんをする！")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
