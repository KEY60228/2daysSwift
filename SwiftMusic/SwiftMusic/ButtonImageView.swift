//
//  ButtonImageView.swift
//  SwiftMusic
//
//  Created by 山口健太 on 2021/07/18.
//

import SwiftUI

struct ButtonImageView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "cymbal")
    }
}
