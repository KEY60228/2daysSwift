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
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        // 撮影した写真をcaptureImageに保存
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            parent.isShowSheet = false
        }
        
        // キャンセルボタンを選択された時に呼ばれる
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    }
}
