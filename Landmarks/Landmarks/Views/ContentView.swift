//
//  ContentView.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList()
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
