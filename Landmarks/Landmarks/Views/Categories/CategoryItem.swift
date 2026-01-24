//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 서광용 on 1/24/26.
//

import SwiftUI

struct CategoryItem: View {
  var landmark: Landmark
  
  var body: some View {
    VStack(alignment: .leading) {
      landmark.image
        .renderingMode(.original) // 링크나 버튼 효과 무시 -> 사진 그대로 출력(.original)
        .resizable()
        .frame(width: 155, height: 155)
        .cornerRadius(5)
      Text(landmark.name)
        .foregroundStyle(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

#Preview {
  CategoryItem(landmark: ModelData().landmarks[0])
}
