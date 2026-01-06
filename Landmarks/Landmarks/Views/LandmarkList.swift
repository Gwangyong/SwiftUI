//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkList: View {
  // 즐겨찾기 목록만 보여줄지 여부를 결정하는 상태 값
  @State private var showFavoritesOnly = false
  
  var filteredLandmarks: [Landmark] {
    landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    // iPad 기준, 왼쪽 영역 (목록/사이드바)
    NavigationSplitView {
      List {
        // @Binding: 상태 값을 읽고/변경하기 위한 연결
        // $: @State를 Binding 타입으로 꺼내기 위한 문법
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }
        
        // ForEach: 동적으로 landmark 개수만큼 row 생성
        ForEach(filteredLandmarks) { landmark in
          NavigationLink { // 어떤 View를 누르면, 다른 View로 이동시키는 컴포넌트
            // 자동으로 chevron(>) 추가
            LandmarkDetail(landmark: landmark) // destination (눌렀을 때 나타날 화면)
          } label: { // 사용자가 실제로 누르는 UI (터치 영역)
            LandmarkRow(landmark: landmark)
          }
        }
      }
      // value의 값이 변경될 때마다 애니메이션
      .animation(.default, value: filteredLandmarks)
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

// MARK: List Identity
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


// MARK: @State
// SwiftUI의 View는 값 타입(struct)이며, 상태가 없으면 불변처럼 동작
// 단순 변수(var)는 런타임 중에 값이 변경되더라도, UI 갱신 트리거가 되지 않아 반영이 되지 않음
// 이를 해결하기 위해서 View 내부 상태를 관리하는 @State가 존재함
//
// @State는 UI에 영향을 주는 값을 SwiftUI가 메모리에 따로 저장하고,
// 값이 변경되면 SwiftUI가 이를 감지해서 body를 다시 계산하고 UI를 갱신함
//
// View 내부 전용 상태라서, 외부에서 접근하거나 주입이 불가능함
// 또한, Apple 가이드라인에 따라서 private 선언이 권장됨
//
// 즉, @State는 SwiftUI View 안에서만 사용하는 UI 업데이트를 트리거하는 로컬 상태 저장소
