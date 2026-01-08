//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 서광용 on 12/21/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(modelData)
    }
  }
}

/*
 
 MARK: View 구조
 LandmarksApp (@main, 최상위)
  └─ ContentView
      └─ LandmarkList
 
 MARK: 이해한 내용 정리
 LandmarkList에서 @Envrionment(ModelData.self)를 사용
 -> 상위 View 트리 어딘가에서 .enviroment(ModelData 인스턴스)가 반드시 한 번은 있어야함
(바로 상위 뷰가 아닌, 상위 중 아무 View에서나 주입해주면 됨)
 
 ContentView에서 주입해도 좋지만, ContentView와 형제 View가 생길 수 있으니, 최상위 뷰에서 주입하는게 안전하다는 생각
 
 ContentView()
  .environemt(ModelData())로 사용해도 동작은 하겠지만,
 body가 계산될 때마다 새 인스턴스가 만들어져서 원하지 않는 동작을 할 수 있음.
 
 그래서 body 밖에 @State로 ModelData 인스턴스를 한 번 생성해서 유지.
 
 MARK: 정리
 LandmarksApp은 @State로 ModelData 인스턴스를 한 번 생성해서 유지,
 그 인스턴스를 .environment로 View 트리에 주입
 하위 View들은 @Environment로 이를 받아서 사용함
 ModelData가 @Observable이기 때문에, 내부 데이터 변경 시 UI가 자동으로 갱신됨
 
 MARK: @State, @Observable(추가)
 View는 가볍고, Model은 공유되어야함.
 
 @State는 View 하나의 로컬 상태,
 @Observable은 여러 View가 공유하는 객체 상태를
 SwiftUI가 감지하도록 만드는 도구
 
 */
