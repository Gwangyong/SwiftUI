//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    List(landmarks) { landmark in
      LandmarkRow(landmark: landmark)
    }
  }
}

#Preview {
  LandmarkList()
}
