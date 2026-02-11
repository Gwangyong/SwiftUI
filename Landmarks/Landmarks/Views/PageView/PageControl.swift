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
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl() // UIKit 객체
    control.numberOfPages = numberOfPages // SwiftUI값 -> UIKit 프로퍼티 복사
    control.addTarget( // UIKit 이벤트 SwiftUI 상태로 전달. 연결코드
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged) // 점 눌러서 UIPageControl 페이지 변경되었을 경우
    
    return control
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
  
  class Coordinator: NSObject {
    var control: PageControl
    
    init(_ control: PageControl) {
      self.control = control
    }
    
    @objc
    func updateCurrentPage(sender: UIPageControl) {
      control.currentPage = sender.currentPage
    }
  }
}

