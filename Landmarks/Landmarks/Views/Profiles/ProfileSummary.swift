//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 서광용 on 1/28/26.
//

import SwiftUI

struct ProfileSummary: View {
  @Environment(ModelData.self) var modelData
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
        
        Divider()
        
        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)
          
          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 90)) // 색상환을 돌려서 색 종류 변경
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5) // 회색톤으로 변환 0.0 ~ 1.0 (50%)
                .hueRotation(Angle(degrees: 45))
            }
            .padding(.bottom)
          }
        }
        
        Divider()
        
        
        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)
          
          HikeView(hike: modelData.hikes[0])
        }
      }
    }
  }
}

#Preview {
  ProfileSummary(profile: Profile.default)
    .environment(ModelData())
}
