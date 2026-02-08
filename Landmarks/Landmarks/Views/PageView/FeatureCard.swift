//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 서광용 on 2/8/26.
//

import SwiftUI

struct FeatureCard: View {
  var landmark: Landmark
  
  var body: some View {
    landmark.featureImage?
      .resizable()
      .overlay { // featureImage 위에 TextOverlay View를 덮어서 올림
        TextOverlay(landmark: landmark)
      }
  }
}

struct TextOverlay: View {
  var landmark: Landmark
  
  var gradient: LinearGradient {
    .linearGradient(
      // bottom에서 검정 0.6 불투명 -> 중간으로 갈수록 검정 0으로 투명해짐. (아래가 더 어두움)
      Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
      startPoint: .bottom,
      endPoint: .center)
  }
  
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      gradient
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .bold()
        Text(landmark.park)
      }
      .padding()
    }
    .foregroundStyle(.white)
  }
}

#Preview {
  FeatureCard(landmark: ModelData().landmarks[0])
    .aspectRatio(3 / 2, contentMode: .fit)
}
