//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack{
      landmark.image
        .resizable() // 부모가 주는 공간에 맞게 이미지 크기를 조정하는 모드로 설정
        .frame(width: 50, height: 50)
      Text(landmark.name)
      
      Spacer()
      
    }
  }
}

#Preview {
  LandmarkRow(landmark: landmarks[0])
}
