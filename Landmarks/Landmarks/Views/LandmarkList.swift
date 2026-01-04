//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 서광용 on 1/4/26.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    List {
      LandmarkRow(landmark: landmarks[0])
      LandmarkRow(landmark: landmarks[1])
    }
  }
}

#Preview {
  LandmarkList()
}
