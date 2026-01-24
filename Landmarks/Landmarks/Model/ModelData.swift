//
//  ModelData.swift
//  Landmarks
//
//  Created by 서광용 on 12/22/25.
//

import Foundation

@Observable
class ModelData {
  var landmarks: [Landmark] = load("landmarkData.json")
  var hikes: [Hike] = load("hikeData.json")
  
  var features: [Landmark] {
    landmarks.filter { $0.isFeatured }
  }
  
  var categories: [String: [Landmark]] { // ex. "Lakes": [Landmark, Landmark, ...]
    Dictionary(
      grouping: landmarks, // ladnmarks 배열을 하나씩 순회
      by: { $0.category.rawValue } // 각 Landmark의 category.rawValue를 Key로 사용해 그룹핑
    )
    /*
     
     categories = [
       "Lakes":     [Landmark, Landmark, ...],
       "Rivers":    [Landmark, Landmark, ...],
       "Mountains": [Landmark, Landmark, ...]
     ]
     
     */
  }
}

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
