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
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView()
    }
}
