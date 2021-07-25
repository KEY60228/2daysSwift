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
    @State var isShowActivity = false
    @State var isPhotoLibrary = false
    @State var isShowAction = false
    
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
                isShowAction = true
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
                if isPhotoLibrary {
                    PHPickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                } else {
                    ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                }
            }
            .actionSheet(isPresented: $isShowAction) {
                ActionSheet(title: Text("確認"), message: Text("選択してください"), buttons: [
                                .default(Text("カメラ"), action: {
                                    isPhotoLibrary = false
                                }),
                                .default(Text("フォトライブラリー"), action: {
                                    isPhotoLibrary = true
                                }),
                                .cancel()
                ])
            }
            Button(action: {
                // 撮影した写真がある時のみUIActivityControllerを表示
                if let _ = captureImage {
                    isShowActivity = true
                }
            }) {
                Text("SNSに投稿する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            .sheet(isPresented: $isShowActivity) {
                ActivityView(shareItems: [captureImage!])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
