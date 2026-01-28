//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 서광용 on 1/28/26.
//

import SwiftUI

struct ProfileSummary: View {
  var profile: Profile
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text(profile.username)
          .bold()
          .font(.title)
        
        Text("Notifications: \(profile.prefersNotifications ? "On" : "Off" )")
        Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")

        // style: Text 전용 Date 포맷 옵션. 기기의 지역/언어 설정에 맞게 표시하는 스유 내부 Formatter
        // Text("Goal Date: ") + Text(profile.goalDate, style: .date) // 더 이상 권장x 방식
        Text("Goal Date: \(profile.goalDate, style: .date)")
      }
    }
  }
}

#Preview {
  ProfileSummary(profile: Profile.default)
}
