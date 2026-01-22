//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 서광용 on 1/22/26.
//

import SwiftUI

struct CategoryHome: View {
  var body: some View {
    NavigationSplitView {
      Text("Hello")
        .navigationTitle("Featured")
    } detail: {
      Text("select a Landmark")
      // 여기도 .navigationTitle 가능. 다만, iPad에서만 보임
    }
  }
}

#Preview {
  CategoryHome()
}
