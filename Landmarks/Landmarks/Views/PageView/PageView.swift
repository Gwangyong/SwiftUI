//
//  PageView.swift
//  Landmarks
//
//  Created by 서광용 on 2/8/26.
//

import SwiftUI

struct PageView<Page: View>: View {
  var pages: [Page]
  
  var body: some View {
    PageViewController(pages: pages)
      .aspectRatio(3 / 2, contentMode: .fit)
  }
}

#Preview {
  PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
