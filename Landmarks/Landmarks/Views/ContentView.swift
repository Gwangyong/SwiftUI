//
//  ContentView.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI

struct ContentView: View {
  @State private var selection: Tab = .featured
  
  enum Tab {
    case featured
    case list
  }
  
  var body: some View {
    TabView(selection: $selection) { // 사용자가 tab하면 $selection의 값이 변동
      // 탭 순서: 왼쪽부터 나오는 순서는 코드에 나오는 순서대로
      CategoryHome()
        .tabItem {
          Label("Featured", systemImage: "star")
        }
        .tag(Tab.featured)
      // .tag: 이 뷰가 어떤 선택값에 대응되는지 붙여주는 식별자 (selection에 실제 저장되는 값과 타입이 일치해야함)
      
      LandmarkList()
        .tabItem {
          Label("List", systemImage: "list.bullet")
        }
        .tag(Tab.list)
    }
    
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}

// MARK: Environment
//
// @Environment는 "현재 View가 속한 View Tree(= 상위 뷰가 내려준 환경)"에서
// 특정 값을 읽어와서 "이 View에서 쓰겠다"는 의미
//
// - 하위 뷰: @Environment로 값을 "읽는다"
// - 상위 뷰: .environment(...)로 값을 "흘려보낸다" (주입한다)
