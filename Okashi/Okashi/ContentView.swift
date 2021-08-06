//
//  ContentView.swift
//  Okashi
//
//  Created by 山口健太 on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    // OkashiDataを参照する状態変数
    @ObservedObject var okashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        VStack {
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                okashiDataList.searchOkashi(keyword: inputText)
            })
            List(okashiDataList.okashiList) { okashi in
                // okashiに要素を取り出して、Listを生成する
                // 水平にレイアウト
                HStack {
                    // 画像を表示する
                    Image(uiImage: okashi.image)
                    // テキストを表示する
                    Text(okashi.name)
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
