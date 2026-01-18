//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by 서광용 on 1/13/26.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
  struct Segment {
    let line: CGPoint    // 현재 위치에서 직선으로 이동할 끝점 (도착 지점)
    let curve: CGPoint   // line까지 온 뒤, 곡선으로 이동해서 최종적으로 도착할 지점
    let control: CGPoint // curve로 가는 곡선이 얼마나 휘어질지 결정하는 제어점
  }
  
  // 그냥 더하고 빼면, 이 값을 어떤 의도로 어디를 보정한지 모르기에, adjustment를 생성하여 더하고 빼며 사용
  static let adjustment: CGFloat = 0.085 // 렌더링 결과를 보고 눈으로 맞춘 값 (보정값)
  
  static let segments = [
    Segment(
      line: CGPoint(x: 0.60, y: 0.05),
      curve: CGPoint(x: 0.40, y: 0.05),
      control: CGPoint(x: 0.50, y: 0.00)
    ),
    Segment(
      line: CGPoint(x: 0.05, y: 0.20 + adjustment),
      curve: CGPoint(x: 0.00, y: 0.30 + adjustment),
      control: CGPoint(x: 0.00, y: 0.25 + adjustment)
    ),
    Segment(
      line: CGPoint(x: 0.00, y: 0.70 - adjustment),
      curve: CGPoint(x: 0.05, y: 0.80 - adjustment),
      control: CGPoint(x: 0.00, y: 0.75 - adjustment)
    ),
    Segment(
      line: CGPoint(x: 0.40, y: 0.95),
      curve: CGPoint(x: 0.60, y: 0.95),
      control: CGPoint(x: 0.50, y: 1.00)
    ),
    Segment(
      line: CGPoint(x: 0.95, y: 0.80 - adjustment),
      curve: CGPoint(x: 1.00, y: 0.70 - adjustment),
      control: CGPoint(x: 1.00, y: 0.75 - adjustment)
    ),
    Segment(
      line: CGPoint(x: 1.00, y: 0.30 + adjustment),
      curve: CGPoint(x: 0.95, y: 0.20 + adjustment),
      control: CGPoint(x: 1.00, y: 0.25 + adjustment)
    )
  ]
}
