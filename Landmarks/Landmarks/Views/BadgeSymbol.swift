//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by 서광용 on 1/18/26.
//

import SwiftUI

struct BadgeSymbol: View {
  static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
  
  var body: some View {
    GeometryReader { geometry in
      Path { path in
        let width = min(geometry.size.width, geometry.size.height)
        let height = width * 0.75
        let spacing = width * 0.030
        let middle = width * 0.5
        let topWidth = width * 0.226
        let topHeight = height * 0.448
        
        path.addLines([
          CGPoint(x: middle, y: spacing),
          CGPoint(x: middle - topWidth, y: topHeight - spacing),
          CGPoint(x: middle, y: topHeight / 2 + spacing),
          CGPoint(x: middle + topWidth, y: topHeight - spacing),
          CGPoint(x: middle, y: spacing)
        ])
        
        // 새로운 도형을 그리기 위해서
        // 이전 도형과 선을 잇지않고, 새로운 시작점으로 옮김
        path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
        path.addLines([
          CGPoint(x: middle - topWidth, y: topHeight + spacing),
          CGPoint(x: spacing, y: height - spacing),
          CGPoint(x: width - spacing, y: height - spacing),
          CGPoint(x: middle + topWidth, y: topHeight + spacing),
          CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
        ])
      }
      .fill(Self.symbolColor)
    }
  }
}

#Preview {
  BadgeSymbol()
}
