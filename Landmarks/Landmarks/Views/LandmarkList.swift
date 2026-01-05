//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    NavigationSplitView {
      // iPad 기준, 왼쪽 영역 (리스트)
      List(landmarks) { landmark in
        NavigationLink { // 어떤 View를 누르면, 다른 View로 이동시키는 컴포넌트
          // 자동으로 chevron(>) 추가
          LandmarkDetail(landmark: landmark) // destination (눌렀을 때 나타날 화면)
        } label: { // 사용자가 실제로 누르는 UI (터치 영역)
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationTitle("Landmarks") // 목록의 Title
    } detail: {
      // iPad 기준, 오른쪽 영역 (상세화면)
      Text("Select a Landmark")
    }
  }
}

#Preview {
  LandmarkList()
}

// MARK: - Learned

// SwiftUI List는 UIKit의 UITableView처럼 index 기반으로 동작하지 않음.
// 각 row를 "몇 번째"가 아니라, "누구인지(Identity)"로 구분
// 그래서 List(landmarks)를 사용할때, 요소가 Identifiable을 채택하거나, id 기준(KeyPath)을 명시해줘야함.
//
// UIKit처럼 forEach 개념으로 자동 순회할거라 생각했지만,
// SwiftUI는 diff 기반 렌더링이라 id가 없으면 에러가 발생함.
//
// 추가로, id 대신 "중복되지 않는다는 보장"이 있는 name을 기준으로도 가능.
// 다만 name은 값 변경이나 중복 가능성이 있으므로 안전하지 않음
// SwiftUI가 원하는 것은 id 자체가 아니라, 각 요소를 항상 유일하게 식별할 수 있는 "고유성"이며,
// 이거슬 보장하기 위해 Identifiable를 채택하는 것이 가장 안전한 방식.
