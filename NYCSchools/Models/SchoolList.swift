//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/21/21.
//

import Foundation

private struct DummyCodable: Codable {}

class SchoolList: Decodable {
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
            while !schoolDataContainer.isAtEnd {
                switch schoolDataContainer.currentIndex {
                case 8:
                    school.dbn = try schoolDataContainer.decode(String.self)
                case 9:
                    school.name = try schoolDataContainer.decode(String.self)
                case 10:
                    school.boro = try schoolDataContainer.decode(String.self)
                case 22:
                    school.neighborhood = try schoolDataContainer.decode(String.self)
                case 30:
                    school.urlString = try schoolDataContainer.decode(String.self)
                default:
                    _ = try? schoolDataContainer.decode(DummyCodable.self)
                }
            }
            self.schools.append(school)
        }
    }
}
