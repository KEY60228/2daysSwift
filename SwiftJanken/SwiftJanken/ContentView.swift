//
//  ContentView.swift
//  SwiftJanken
//
//  Created by 山口健太 on 2021/07/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // グーの画像を配置
        Image("gu")
            // リサイズ
            .resizable()
            // アスペクト
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
