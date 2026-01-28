//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 서광용 on 1/22/26.
//

import SwiftUI

struct CategoryHome: View {
  @Environment(ModelData.self) var modelData
  @State private var showingProfile = false // 사용자 프로필
  
  var body: some View {
    NavigationSplitView {
      List { // UIKit의 TableView역할
        ModelData().features[0].image
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped() // frame영역 밖으로 나간 부분을 자름
        // UIKit의 clipsToBounds와 동일 역할. (다만, UIKit은 bounds기준, SwiftUI는 frame기준)
        // ForEach: numberOfRowsInSection + cellForRowAt역할
          .listRowInsets(EdgeInsets())
        // 해당 List row의 기본 여백을 0으로 만들어서 컨텐츠가 좌우로 꽉 차게 하는 역할
        // EdgeInsets()는 기본 값이 전부 0이라서, Edge 패딩을 0으로 만듦
        
        
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
        .listRowInsets(EdgeInsets())
      }
      // listStyle: List 기본 외형과 동작 정함
      .listStyle(.insetGrouped)
      .navigationTitle("Featured")
      .toolbar {
        Button {
          showingProfile.toggle() // 버튼 누를시 값 toggle
        } label: { // Text는 글자만 있음. Label은 텍스트 + 아이콘, 시스템이 자동 레이아웃 결정
          Label("User Profile", systemImage: "person.crop.circle")
        }
      }
      // showingProfile 관찰. true되면 시트를 띄움. false면 내림
      .sheet(isPresented: $showingProfile) {
        ProfileHost()
          .environment(modelData) // 동일한 인스턴스 주입
      }
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
