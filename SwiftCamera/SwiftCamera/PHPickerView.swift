//
//  PHPickerView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/25.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PHPickerView
        init(parent: PHPickerView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let result = results.first {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let unwrapImage = image as? UIImage {
                        self.parent.captureImage = unwrapImage
                    } else {
                        print("選択された写真は存在しません")
                    }
                    self.parent.isShowSheet = false
                }
            }
        }
    }
}
