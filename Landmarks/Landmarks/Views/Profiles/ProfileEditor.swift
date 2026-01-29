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
  
  var dateRange: ClosedRange<Date> { // ClosedRange: 날짜 밤위를 '양 끝까지 포함'
    // goalDate 기준 정확히 1년전(-1, .year)날짜 계산
    let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
    let max = Calendar.current.date(byAdding: .year, value: +1, to: profile.goalDate)!
    return min...max // goalDate 기준 1년 전/후 날짜 범위
  }
  
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
      
      // selection: 바꿀 대상 값, dateRange: 선택 가능한 날짜 범위 제한
      // displayedComponents: 보여줄 구성요소(.date: 날짜만, .hourAndMinute 시간만)
      // [.date, .hourAndMinute]로 날짜 + 시간 둘 다 표시 가능
      DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
        Text("Goal Date")
      }
    }
  }
}

#Preview {
  ProfileEditor(profile: .constant(.default))
}
