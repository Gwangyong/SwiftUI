//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(ModelData.self) var modelData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    // isSet 파라미터는 Binding<Bool> 타입
    // @Bindable로 modelData를 감싸서 $modelData..형태로 Binding을 만들 수 있게함
    // ModelData는 class(참조 타입), 지역 modelData도 같은 인스턴스를 가리킴
    @Bindable var modelData = modelData
    
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)
      
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        
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
  let modelData = ModelData()
  LandmarkDetail(landmark: modelData.landmarks[0])
    .environment(modelData)
}
