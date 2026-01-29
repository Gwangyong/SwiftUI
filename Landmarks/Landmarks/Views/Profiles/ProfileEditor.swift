//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 서광용 on 1/29/26.
//

import SwiftUI

struct ProfileEditor: View {
  // @Binding을 통해 상위뷰의 profile에 직접 접근해서 읽고/쓰기
  @Binding var profile: Profile
  
  var body: some View {
    List {
      HStack {
        Text("Username")
        Spacer()
        // "Username" 값이 비어있을떄 보이는 문구(placeholder)
        // $profile.username: 실제 입력 값 + 화면에 표시되는 값
        // 사용자가 입력할 때마다 TextField가 즉시 그 Binding에 set을 호출.
        // 한 단어 칠 때마다 상위 뷰의 @State profile 값을 변경하게됨.
        TextField("Username", text: $profile.username)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.trailing)
      }
      
      Toggle(isOn: $profile.prefersNotifications) { // toggle 버튼 생성
        Text("Enable Notifications")
      }
      
      Picker("seasonal Photo", selection: $profile.seasonalPhoto) {
        ForEach(Profile.Session.allCases) { season in
          // Picker는 tag만 보고 값을 저장함
          // Text는 화면에 보이는 글자, tag는 선택시 '저장되는 실제 값'
          Text(season.rawValue).tag(season)
        }
      }
    }
  }
}

#Preview {
  ProfileEditor(profile: .constant(.default))
}
