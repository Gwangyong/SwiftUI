//
//  Hike.swift
//  Landmarks
//
//  Created by 서광용 on 1/20/26.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
  var id: Int
  var name: String
  var distance: Double
  var difficulty: Int
  var observations: [Observation]
  
  // 거리 숫자(Double)를 사람이 읽는 문자열(String)로 바꿔주는 포맷터
  static var formatter = LengthFormatter()
  
  var distanceText: String {
    Hike.formatter
      .string(fromValue: distance, unit: .kilometer)
  }
  
  struct Observation: Codable, Hashable {
    var distanceFromStart: Double
    
    var elevation: Range<Double>
    var pace: Range<Double>
    var heartRate: Range<Double>
  }
}
