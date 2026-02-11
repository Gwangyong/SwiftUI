//
//  PageControl.swift
//  Landmarks
//
//  Created by 서광용 on 2/11/26.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
  var numberOfPages: Int
  @Binding var currentPage: Int
  
  func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl() // UIKit 객체
    control.numberOfPages = numberOfPages // SwiftUI값 -> UIKit 프로퍼티 복사
    
    return control
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
}

