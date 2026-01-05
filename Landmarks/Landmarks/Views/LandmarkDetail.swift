//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark
  
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)
      
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
        
        HStack{
          Text(landmark.park)
          Spacer() // 보이지 않지만 남는 공간을 전부 다 차지해서 다른 뷰를 밀어내는 역할
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        
        Divider()
        
        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
    // ScrollView의 safeArea(.top) 무시
    .ignoresSafeArea(edges: .top)
  }
}

#Preview {
  LandmarkDetail(landmark: landmarks[0])
}
