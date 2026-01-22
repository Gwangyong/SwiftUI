//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 서광용 on 1/22/26.
//

import SwiftUI

struct CategoryHome: View {
  @Environment(ModelData.self) var modelData
  
  var body: some View {
    NavigationSplitView {
      List { // UIKit의 TableView역할
        // ForEach: numberOfRowsInSection + cellForRowAt역할
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          Text(key)
        }
      }
      .navigationTitle("Featured")
    } detail: {
      Text("select a Landmark")
      // 여기도 .navigationTitle 가능. 다만, iPad에서만 보임
    }
  }
}

#Preview {
  CategoryHome()
    .environment(ModelData())
}

// MARK: - Learned
//
// MARK: id: \.self
//
// \.self 의미
// • \    → KeyPath 시작
// • self → 현재 요소 자기 자신
// • \.self → “이 요소 자체를 id로 사용”
//
// id: \.self의 의미
// → 각 요소(String) 자체를 식별자로 사용
// → "Lakes" → id = "Lakes", "Rivers" → id = "Rivers"
// → String은 Hashable이며, 카테고리 이름은 중복되지 않으므로 안전
//
// 용도
// → ForEach에서 각 행(View)을 고유하게 식별하기 위한 id 지정
