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
  @Binding var currentPage: Int // 지금 몇 번째 페이지를 보여줄지 index
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    // 수평으로 스크롤되는 페이지 뷰 컨트롤러 생성
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    // 다음/이전 페이지 계산은 coordinator한테 맡김(dataSource)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers(
      [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
  }
  
  // MARK: - Coordinator
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController // parent.pages처럼 접근하기 위해
    var controllers = [UIViewController]()
    
    init(_ pageViewController: PageViewController) {
      parent = pageViewController
      // UIHostingController(rootView: SwiftUIView): SwiftUI 화면을 UIKit 컨트롤러로 변환해주는 어댑터
      controllers = parent.pages.map { UIHostingController(rootView: $0) }
    }
    
    // MARK: - 현재 페이지 기준으로 이전/다음에 보여줄 UIViewController를 반환하는 메서드들 (DataSource)
    
    // MARK: viewControllerBefore: 왼쪽(이전) 페이지
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 { // 이전 페이지 없음
        return controllers.last // 마지막 페이지로 순환 이동
      }
      return controllers[index - 1] // 이전 페이지 index번호 반환
    }
    
    // MARK: viewControllerBefore: 오른쪽(다음) 페이지
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == controllers.count { // index + 1이 controllers의 개수랑 같음 == 마지막 페이지
        return controllers.first // 첫 페이지로 순환 이동
      }
      return controllers[index + 1] // 다음 페이지 index 번호 반환
    }
    
    // MARK: - Delegate
    // didFinishAnimating: 페이지 전환 애니메이션이 끝났을 떄 호출
    func pageViewController(
      _ pageViewController: UIPageViewController,
      didFinishAnimating finished: Bool,
      previousViewControllers: [UIViewController],
      transitionCompleted completed: Bool
    ) {
      if completed,
         let visibleViewController = pageViewController.viewControllers?.first, // 현재 보이는 VC 가져오기
         let index = controllers.firstIndex(of: visibleViewController) { // 그 VC가 controllers 배열에서 몇 번째인지 찾기
        parent.currentPage = index // 현재 페이지를 부모에게 상태 전달
      }
    }
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

// MARK: Coordinator
//
// Coordinator = SwiftUI와 UIKit 사이에서 "상태를 들고 이벤트를 받아 처리하는 중간 관리자(class)
// SwiftUI의 PageVC는 자주 새로 만들어질 수 있음 (값 타입, 재렌더링)
// UIKit의 delegate/dataSource는 한 번 연결하면 계속 살아있어야 하는 객체(class)를 요구
// 그래서 SwiftUI가 그 역할은 class를 따로 두고 써라. 하고 만든 공식 통로 => Coordinator
// 즉, delegate/dataSource 같은 UIKitㅇ 콜백을 받을 클래스 자리를 SwiftUI가 제공한게 Coordinator이다.
