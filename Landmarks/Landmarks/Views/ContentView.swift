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

// MARK: Enviroment
//
// 하위뷰인 LandmarkList에서 @Environment 사용해서
// "환경에 들어있는 값을 가져와서 변수로 쓰겠다"
// 즉, 쓰는 쪽.
//
// 여기서는 ContentView가 LandmarkList의 상위뷰
// 그렇기에 하위뷰에서 쓰려면 상위뷰에서 데이터를 넣어줘야함
// 그렇기에 .environment로 이 "View 트리 아래로 ModelData를 흘려보냄"
//
// 하위 뷰: @Environment로 가져옴
// 상위 뷰: .environment로 주입함
