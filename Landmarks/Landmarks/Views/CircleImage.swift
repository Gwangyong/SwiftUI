//
//  CircleImage.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  
  var body: some View {
    image
      .clipShape(Circle())
      .overlay { // 현재 View위에 다른 View를 겹쳐서 올림
        Circle().stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

#Preview {
  CircleImage(image: Image("turtlerock"))
}
