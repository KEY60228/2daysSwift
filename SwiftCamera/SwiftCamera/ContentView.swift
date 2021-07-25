//
//  ContentView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            if let unwrapCaptureImage = captureImage {
                Image(uiImage: unwrapCaptureImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                // カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("カメラは利用できます")
                    isShowSheet = true
                } else {
                    print("カメラは利用できません")
                }
            }) {
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            // isPresentedで指定した状態変数がtrueの時に実行される
            .sheet(isPresented: $isShowSheet) {
                // UIImagePickerControllerのsheetを表示
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
