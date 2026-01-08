//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 서광용 on 1/8/26.
//

import SwiftUI

struct FavoriteButton: View {
  // 원본 데이터가 변경되어야 해서 @State가 아닌, @Binding사용
  @Binding var isSet: Bool
  
  var body: some View {
    Button {
      // 내부적으로 Binding.get으로 값을 읽고, Binding.set을 호출
      isSet.toggle()
    } label: {
      Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
      // 시각적으로는 별만 보이지만, VoiceOver에서는 "Toggle Favorite" 같은 설명을 읽어줌
        .labelStyle(.iconOnly)
        .foregroundStyle(isSet ? .yellow : .gray)
    }
  }
}

#Preview {
  FavoriteButton(isSet: .constant(true))
}
