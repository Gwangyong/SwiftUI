//
//  ModelData.swift
//  Landmarks
//
//  Created by 서광용 on 12/22/25.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  
  // 앱 번들 내에서 filename에 해당하는 파일 URL 찾기
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
    // 파일 -> Data 타입으로 로딩
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data) // JSON 데이터를 T 타입으로 디코딩
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
