//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 서광용 on 1/24/26.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { landmark in
            NavigationLink {
              LandmarkDetail(landmark: landmark) // 이동할 화면
            } label: {
              CategoryItem(landmark: landmark) // label (화면에 보여질 UI, 탭 영역)
            }
          }
        }
      }
      .frame(height: 185)
    }
  }
}

#Preview {
  let landmarks = ModelData().landmarks
  return CategoryRow(
    categoryName: landmarks[0].category.rawValue,
    items: Array(landmarks.prefix(4))
  )
}
