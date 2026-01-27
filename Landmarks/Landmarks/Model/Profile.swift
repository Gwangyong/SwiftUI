//
//  Profile.swift
//  Landmarks
//
//  Created by 서광용 on 1/27/26.
//

import Foundation

struct Profile {
  var username: String
  var prefersNotifications = true
  var seasonalPhoto = Session.winter
  var goalDate = Date()
  
  // ``는 default 예약어가 있기에 충돌되지 않기위해 백틱 사용
  // 백틱(``)은 키워드가 아니라 '식별자 이름'으로 쓰겠다. 하고 컴파일러에 알려주는 역할
  // 정의할때만 백틱을 사용하고, 사용할때는 생략 가능함
  static let `default` = Profile(username: "MoriOS")
  
  enum Session: String, CaseIterable, Identifiable { // Identifiable: 이 타입은 id라는 고유 식별자를 제공한다. 는 약속
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"
    
    var id: String { rawValue }
  }
}
