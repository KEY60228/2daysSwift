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
    // SafariViewの表示有無を管理する変数
    @State var showSafari = false
    
    var body: some View {
        VStack {
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                okashiDataList.searchOkashi(keyword: inputText)
            })
            .padding()
            List(okashiDataList.okashiList) { okashi in
                // 1つ1つボタンを用意
                Button(action: {
                    // SafariViewを表示する
                    showSafari.toggle()
                }) {
                    // okashiに要素を取り出して、Listを生成する
                    // 水平にレイアウト
                    HStack {
                        // 画像を表示する
                        Image(uiImage: okashi.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        // テキストを表示する
                        Text(okashi.name)
                    }
                }
                .sheet(isPresented: self.$showSafari, content: {
                    // SafariViewを表示する
                    SafariView(url: okashi.link)
                        .edgesIgnoringSafeArea(.bottom)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
