//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 서광용 on 1/27/26.
//

import SwiftUI

struct ProfileHost: View {
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
}
