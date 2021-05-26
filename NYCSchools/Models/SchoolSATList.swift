//
//  SchoolSATList.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import Foundation

class SchoolSATList: Decodable {
    var schools = [School]()

    enum CodingKeys: String, CodingKey {
        case data
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var dataContainer = try container.nestedUnkeyedContainer(forKey: .data)
        while !dataContainer.isAtEnd {
            var schoolDataContainer = try dataContainer.nestedUnkeyedContainer()
            var school = School()
            loop: while !schoolDataContainer.isAtEnd {
                switch schoolDataContainer.currentIndex {
                case 8:
                    school.dbn = try schoolDataContainer.decode(String.self)
                case 10:
                    let numSATTestTakersStr = try schoolDataContainer.decode(String.self)
                    school.numSATTestTakers = Int(numSATTestTakersStr) ?? 0
                case 11:
                    let avgSATReadingScoreStr = try schoolDataContainer.decode(String.self)
                    school.avgSATReadingScore = Int(avgSATReadingScoreStr) ?? 0
                case 12:
                    let avgSATMathScoreStr = try schoolDataContainer.decode(String.self)
                    school.avgSATMathScore = Int(avgSATMathScoreStr) ?? 0
                case 13:
                    let avgSATWritingScoreStr = try schoolDataContainer.decode(String.self)
                    school.avgSATWritingScore = Int(avgSATWritingScoreStr) ?? 0
                    break loop
                default:
                    _ = try? schoolDataContainer.decode(DummyCodable.self)
                }
            }
            self.schools.append(school)
        }
    }
}
