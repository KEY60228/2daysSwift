//
//  ImagePickerView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/24.
//

import SwiftUI

struct ImagePickerView: UIViewCOntrollerRepresentable {
    // UIImagePickerController (写真撮影画) が表示されているか
    @Binding var isShowSheet: Bool
    // 撮影した写真
    @Binding var captureImage: UIImage?
}
