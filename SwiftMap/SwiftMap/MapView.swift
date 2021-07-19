//
//  MapView.swift
//  SwiftMap
//
//  Created by 山口健太 on 2021/07/19.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let searchKey: String

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
