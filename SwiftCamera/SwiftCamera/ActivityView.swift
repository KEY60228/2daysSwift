//
//  ActivityView.swift
//  SwiftCamera
//
//  Created by 山口健太 on 2021/07/25.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    // UIActivityViewControllerでシェアする写真
    let shareItems: [Any]
    
    // 表示するViewを生成するタイミングで実行
    func makeUIViewController(context: Context) -> UIViewController {
        // UIActivityViewControllerでシェアする機能
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        // UIActivityViewCtonrollerを返す
        return controller
    }
    
    // Viewが更新されるタイミングで実行
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        
    }
}
