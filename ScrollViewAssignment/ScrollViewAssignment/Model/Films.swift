//
//  Films.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 17.08.2021.
//

import Foundation

struct Films: Decodable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
