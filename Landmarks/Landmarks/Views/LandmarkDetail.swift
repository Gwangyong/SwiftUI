//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkDetail: View {
  var body: some View {
    VStack {
      MapView()
        .frame(height: 300)
      
      CircleImage()
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)
        
        HStack{
          Text("Joshua Tree National Park")
          Spacer() // 보이지 않지만 남는 공간을 전부 다 차지해서 다른 뷰를 밀어내는 역할
          Text("California")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        
        Divider()
        
        Text("About Turtle Rock")
          .font(.title2)
        Text("Descriptive text goes here.")
      }
      .padding()
      
      Spacer()
    }
  }
}

#Preview {
  LandmarkDetail()
}
