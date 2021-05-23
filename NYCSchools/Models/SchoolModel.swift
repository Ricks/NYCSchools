//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import Foundation

class SchoolModel {
    let schools: [School]

    init() {
        guard let file = Bundle.main.url(forResource: "School_data", withExtension: "json") else {
            fatalError("No file School_data.json in bundle")
        }
        let res1 = Result { try Data(contentsOf: file) }
        guard let jsonData = res1.success else {
            fatalError("Could not load file School_data.json: \(String(describing: res1.failure))")
        }
        let decoder = JSONDecoder()
        let res2 = Result { try decoder.decode(SchoolList.self, from: jsonData) }
        guard let schoolList = res2.success else {
            fatalError("Could not decode file School_data.json: \(String(describing: res2.failure))")
        }
        schools = schoolList.schools
    }
}
