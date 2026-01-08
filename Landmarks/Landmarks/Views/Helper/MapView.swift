//
//  MapView.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI
import MapKit

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  
  var body: some View {
    // position은 Map의 카메라 상태를 외부랑 공유하기 위한 Binding
    // .constant는 해당 위치를 고정한 채 표시만 하는 Map
    Map(position: .constant(.region(region)))
  }
  
  private var region: MKCoordinateRegion {
    MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
}

#Preview {
  MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
