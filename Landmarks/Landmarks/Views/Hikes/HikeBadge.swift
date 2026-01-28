//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 서광용 on 1/28/26.
//

import SwiftUI

struct HikeBadge: View {
  var name: String
  
  var body: some View {
    VStack(alignment: .center) {
      Badge()
        .frame(width: 300, height: 300) // 실제 렌더링 300x300로 그림
      // scaleEffect는 레이아웃 크기를 바꾸지 않고, "시각적으로만 변형"한다.
      // 위 렌더링 결과를 시각적으로만 1/3로 축소 (실제 기준은 300x300)
        .scaleEffect(1.0 / 3.0)
        .frame(width: 100, height: 100) // 레이아웃상 100x100으로 취급 (부모 뷰에게 보고하는 크기)
      Text(name)
        .font(.caption)
      // accessibilityLabel: VoiceOver 같은 접근성 기능에서 읽히는 "대체 텍스트"
        .accessibilityLabel("Badge for \(name).")
    }
  }
}

#Preview {
  HikeBadge(name: "Preview Testing")
}
