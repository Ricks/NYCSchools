//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/21/21.
//

import Foundation

class SchoolList: Decodable {
    var schools = [School]()

    let boroughMap = ["K": "Brooklyn",
                      "M": "Manhattan",
                      "Q": "Queens",
                      "R": "Staten Island",
                      "X": "The Bronx"]

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
                case 9:
                    school.name = try schoolDataContainer.decode(String.self)
                case 10:
                    let boroughCode = try schoolDataContainer.decode(String.self)
                    school.borough = boroughMap[boroughCode] ?? "Unknown"
                case 22:
                    school.neighborhood = try schoolDataContainer.decode(String.self)
                case 30:
                    school.urlString = try schoolDataContainer.decode(String.self)
                    break loop
                default:
                    _ = try? schoolDataContainer.decode(DummyCodable.self)
                }
            }
            self.schools.append(school)
        }
    }
}
