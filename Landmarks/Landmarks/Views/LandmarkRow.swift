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
      
      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
    }
  }
}

// MARK: - Preview를 여러개 생성 및 미리보기 이름 지정
#Preview("Turtle Rock") { // Preview 이름 지정
  LandmarkRow(landmark: landmarks[0])
}

#Preview("Salmon") {
  LandmarkRow(landmark: landmarks[1])
}

// MARK: - 하나의 Preview 안에서 여러 뷰를 Group으로 묶어서 표시
#Preview("Merge") {
  Group {
    LandmarkRow(landmark: landmarks[0])
    LandmarkRow(landmark: landmarks[1])
  }
}
