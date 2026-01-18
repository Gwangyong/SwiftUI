//
//  Badge.swift
//  Landmarks
//
//  Created by 서광용 on 1/18/26.
//

import SwiftUI

struct Badge: View {
  // ZStack 안이 길어지면 가독성도 떨어지고, 분리해서 읽기 쉽게함
  var badgeSymbols: some View {
    ForEach(0..<8) { index in
      RotatedBadgeSymbol(
        // Double 나눗셈이라 0~1사이를 균등히 8등분한 값
        // 다음 360을 곱해, 원을 8등분해서 심볼을 배치할 수 있음
        angle: .degrees(Double(index) / Double(8)) * 360
      )
    }
    .opacity(0.5)
  }
  
  var body: some View {
    ZStack{
      BadgeBackground()
      
      GeometryReader { geometry in
        badgeSymbols
          .scaleEffect(1.0 / 4.0, anchor: .top) // 위쪽(top)을 기준으로 1/4 크기로 축소
          .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
      }
    }
    .scaledToFit()
  }
}

#Preview {
  Badge()
}
