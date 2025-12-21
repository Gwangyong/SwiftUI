//
//  ContentView.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Turtle Rock")
        .font(.title)
      HStack{
        Text("Joshua Tree National Park")
          .font(.subheadline)
        Spacer() // 보이지 않지만 남는 공간을 전부 다 차지해서 다른 뷰를 밀어내는 역할
        Text("California")
          .font(.subheadline)
      }
    }
    .padding() // 스세팀이 알아서 주는 기본 여백
  }
}

#Preview {
  ContentView()
}
