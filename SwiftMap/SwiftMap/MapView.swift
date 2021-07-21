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
    let mapType: MKMapType

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        let geocoder = CLGeocoder()
        
        // 入力された文字から位置情報を取得
        geocoder.geocodeAddressString(
            searchKey,
            // placemarksに取得した複数の位置情報が格納される
            // placemarks.locationに位置情報
            // placemarks.coordinateに緯度経度
            completionHandler: {(placemarks, error) in
                // リクエストの結果が存在し、1件目の情報から位置情報を取り出す
                if let unwrapPlacemarks = placemarks,
                    let firstPlacemark = unwrapPlacemarks.first,
                    let location = firstPlacemark.location {
                        let targetCoordinate = location.coordinate
                        print(targetCoordinate)

                        let pin = MKPointAnnotation()
                        pin.coordinate = targetCoordinate
                        pin.title = searchKey
                        uiView.addAnnotation(pin)
                        uiView.region = MKCoordinateRegion(
                            center: targetCoordinate,
                            latitudinalMeters: 500.0,
                            longitudinalMeters: 500.0
                        )
                    }
            }
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
