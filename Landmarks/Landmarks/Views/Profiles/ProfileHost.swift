//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 서광용 on 1/27/26.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @State private var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      ProfileSummary(profile: draftProfile)
    }
    .padding()
  }
}

#Preview {
  ProfileHost()
    .environment(ModelData()) // 자식 뷰에서는 사용하기 때문에
}

// MARK: editMode & KeyPath
//
// 위에서 사용한 `@Environment(\.editMode) var editMode`
// editMode는 SwiftUI가 기본저긍로 제공하는 환경값(Environment value)이다.
// List / EditButton / NavigationStack 같은 컴포넌트가 필요할 때
// 뷰 트리의 Environment에 editMode를 채워 넣어 주기 때문에,
// 내가 직접 주입해주지 않더라도 @Environment(\.editMode)로 읽을 수 있다.
//
// `\.editMode`의 `\.`는 KeyPath 문법이다.
// EnvironmentValues 안에서 "어떤 값을 읽을지"를 정하는 경로(참조)이며,
// 현재 View에 도달한 EnvironmentValues에서 editMode 위치의 값을 읽는다는 의미다.
//
// MARK: `\.xxx` vs `Type.self` 비교
//
// 위의 `\.editMode`와 다른 뷰에서 사용한 `ModelData.self`를 비교하면
// 1) `\.xxx` (KeyPath 기반)
// @Environment(\.editMode) var editMode
// - SwiftUI가 이미 만들어서 내려주는 "환경값"을 읽을 때 사용
// - 예시로 editMode, colorScheme, dismiss 같은 것들이 있다고한다.
// - EnvironmentValues안에 있는 값을 KeyPath(\/xxx)로 지정해서 가져옴
//
// 2) `Type.self` (타입 기반, iOS 17+)
// @Environment(ModelData.self) var modelData
// - 내가 만든 타입을 환경에 넣고 꺼낼 때 사용
// - 상위 뷰에서 .environment(ModelData())로 직접 주입해야함
// - 앱 전반에서 공유할 데이터에 주로 사용함
//
// `\.xxx`: SwiftUI가 이미 준비해둔 값 읽기
// `Type.self`: 내가 만든 객체를 환경으로 주입해서 쓰기
