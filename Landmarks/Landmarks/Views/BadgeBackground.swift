//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 서광용 on 1/13/26.
//

import SwiftUI

struct BadgeBackground: View {
  var body: some View {
    // Path: 도형을 그리기 위한 선(경로) 데이터
    Path { path in
      var width: CGFloat = 100.0
      let height = width
      // move(to: A)는, 그리기 시작 위치를 이 좌표로 설정함.
      // 그려지는게 아닌, 펜을 종이에서 떼고, 지정한 A좌표로 옮겨두는 것
      path.move(
        to: CGPoint(
          x: width * 0.95,
          y: height * (0.20 + HexagonParameters.adjustment)
        )
      )
      
      HexagonParameters.segments.forEach { segment in
        // addLine(to: firstSegment.line)은 현재 위치(A)에서
        // firstSegment.line까지 "직선"을 그림
        // 그리고 "현재 위치(A)가 line으로 갱신"됨.
        path.addLine(
          to: CGPoint(
            x: width * segment.line.x,
            y: height * segment.line.y
          )
        )
        
        path.addQuadCurve(
          to: CGPoint( // 곡선으로 이동해서 도착할 지점
            x: width * segment.curve.x,
            y: height * segment.curve.y
          ),
          control: CGPoint( // 곡선이 휘어지는 방향과 정도를 결정하는 제어점
            x: width * segment.control.x,
            y: height * segment.control.y
          )
        )
      }
    }
    .fill(.black)
  }
}

#Preview {
  BadgeBackground()
}
