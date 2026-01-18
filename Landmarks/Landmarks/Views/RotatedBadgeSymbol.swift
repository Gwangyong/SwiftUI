//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 서광용 on 1/18/26.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
  let angle: Angle
  
  var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(angle, anchor: .bottom) // 아래 기준으로 5도 기울임
  }
}

#Preview {
  RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
