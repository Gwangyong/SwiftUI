//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 서광용 on 1/13/26.
//

import SwiftUI

struct BadgeBackground: View {
  var body: some View {
    // GeometryReader: 부모 레이아웃이 이 View에 준 실제 크기를 읽기 위한 View
    // geometry.size를 통해 동적으로 width / height를 계산할 수 있음
    GeometryReader { geometry in
      // Path: 도형을 그리기 위한 선(경로) 데이터
      Path { path in
        var width: CGFloat = min(geometry.size.width, geometry.size.height)
        let height = width
        let xScale: CGFloat = 0.832 // 가로 비율을 83.2만 사용한다는 뜻
        let xOffset = (width * (1.0 - xScale)) / 2.0 // 중앙 정렬 보정값
        width *= xScale // 실제로 도형을 그릴 가로폭 (height는 원래대로 100)
        // move(to: A)는, 그리기 시작 위치를 이 좌표로 설정함.
        // 그려지는게 아닌, 펜을 종이에서 떼고, 지정한 A좌표로 옮겨두는 것
        path.move(
          to: CGPoint(
            x: width * 0.95 + xOffset,
            y: height * (0.20 + HexagonParameters.adjustment)
          )
        )
        
        HexagonParameters.segments.forEach { segment in
          // addLine(to: firstSegment.line)은 현재 위치(A)에서
          // firstSegment.line까지 "직선"을 그림
          // 그리고 "현재 위치(A)가 line으로 갱신"됨.
          path.addLine(
            to: CGPoint(
              x: width * segment.line.x + xOffset,
              y: height * segment.line.y
            )
          )
          
          path.addQuadCurve(
            to: CGPoint( // 곡선으로 이동해서 도착할 지점
              x: width * segment.curve.x + xOffset,
              y: height * segment.curve.y
            ),
            control: CGPoint( // 곡선이 휘어지는 방향과 정도를 결정하는 제어점
              x: width * segment.control.x + xOffset,
              y: height * segment.control.y
            )
          )
        }
      }
      .fill(.black)
    }
  }
}

#Preview {
  BadgeBackground()
}
