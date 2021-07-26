//
//  EffectView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/26.
//

import SwiftUI

struct EffectView: View {
    // エフェクト編集画面の表示有無
    @Binding var isShowSheet: Bool
    // 撮影した写真
    let captureImage: UIImage
    // 表示する写真
    @State var showImage: UIImage?
    // シェア画面の表示有無
    @State var isShowActivity = false
    
    var body: some View {
        VStack {
            Spacer()
            if let unwrapShowImage = showImage {
                Image(uiImage: unwrapShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                // フィルタ名を指定
                let filterName = "CIPhotoEffectMono"
                // 回転角度を取得
                let rotate = captureImage.imageOrientation
                // UIImage形式の画像をCIImage形式に変更
                let inputImage = CIImage(image: captureImage)
                // CIFilterのインスタンス取得
                guard let effectFilter = CIFilter(name: filterName) else {
                    return
                }
                // フィルタ加工のパラメータを初期化
                effectFilter.setDefaults()
                // インスタンスにフィルタ加工する元画像を設定
                effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
                // フィルタ加工を行う情報を生成
                guard let outputImage = effectFilter.outputImage else {
                    return
                }
                // CIContextのインスタンス取得
                let ciContext = CIContext(options: nil)
                // フィルタ加工後の画像をCIContext上に描画し、結果をcgImageとしてCGImage形式の画像を取得
                guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                    return
                }
                // フィルタ加工後の画像をCGImage形式からUIImage形式に変更。その際に回転角度を指定。
                showImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
            }) {
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            
            Button(action: {
                isShowActivity = true
            }) {
                Text("シェア")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .sheet(isPresented: $isShowActivity) {
                ActivityView(shareItems: [showImage!])
            }
            .padding()
            
            Button(action: {
                isShowSheet = false
            }) {
                Text("閉じる")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        .onAppear {
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(
            isShowSheet: Binding.constant(true),
            captureImage: UIImage(named: "preview_use")!
        )
    }
}
