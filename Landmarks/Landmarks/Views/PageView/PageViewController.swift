//
//  PageViewController.swift
//  Landmarks
//
//  Created by 서광용 on 2/5/26.
//

import SwiftUI
import UIKit

// UIViewControllerRepresentable: SwiftUI의 View처럼 보이지만, 실제 내부 구현은 UIKit의 UIViewController로 함
// SwiftUI와 UIKit 사이클을 연결하는 브리지 프로토콜
struct PageViewController<Page: View>: UIViewControllerRepresentable {
  var pages: [Page]
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    // 수평으로 스크롤되는 페이지 뷰 컨트롤러 생성
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers(
      // UIHostingController(rootView: SwiftUIView): SwiftUI 화면을 UIKit 컨트롤러로 변환해주는 어댑터
      [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
  }
}

// MARK: - Learned
//
// SwiftUI에는 UIKit의 ViewController를 SwiftUI 뷰처럼 감싸서(래핑해서) SwiftUI 화면에 넣을 수 있음
// 그 "랩핑"을 위해서 쓰는게 `UIViewControllerRepresentable` 프로토콜임
//
// 이 프로토콜을 채택하면 2가지 메서드를 추가해야함
// - `makeUIViewController(context:)`: 처음 한 번 VC를 만들어서 SwiftUI 트리에 넣을 때 호출
// - `updateUIViewController(_:context:)`: SwiftUI 상태가 바뀔 때마다 VC를 업데이트할 때 호출
