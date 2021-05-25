//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import Foundation

class SchoolModel {
    var schools: [School]

    init() {
        let decoder = JSONDecoder()

        // Read the school list

        guard let schoolFile = Bundle.main.url(forResource: "School_data", withExtension: "json") else {
            fatalError("No file School_data.json in bundle")
        }
        let schoolRes1 = Result { try Data(contentsOf: schoolFile) }
        guard let jsonSchoolData = schoolRes1.success else {
            fatalError("Could not load file School_data.json: \(String(describing: schoolRes1.failure))")
        }
        let schoolRes2 = Result { try decoder.decode(SchoolList.self, from: jsonSchoolData) }
        guard let schoolList = schoolRes2.success else {
            fatalError("Could not decode file School_data.json: \(String(describing: schoolRes2.failure))")
        }

        // Read the school SAT list

        guard let schoolSATFile = Bundle.main.url(forResource: "SAT_data", withExtension: "json") else {
            fatalError("No file SAT_data.json in bundle")
        }
        let schoolSATRes1 = Result { try Data(contentsOf: schoolSATFile) }
        guard let jsonSchoolSATData = schoolSATRes1.success else {
            fatalError("Could not load file SAT_data.json: \(String(describing: schoolSATRes1.failure))")
        }
        let schoolSATRes2 = Result { try decoder.decode(SchoolSATList.self, from: jsonSchoolSATData) }
        guard let schoolSATList = schoolSATRes2.success else {
            fatalError("Could not decode file SAT_data.json: \(String(describing: schoolSATRes2.failure))")
        }

        // Weave the two lists

        schools = schoolList.schools
        var schoolSATDict = [String: School]()
        for school in schoolSATList.schools {
            schoolSATDict[school.dbn] = school
        }
        for i in 0 ..< schools.count {
            schools[i].numSATTestTakers = schoolSATDict[schools[i].dbn]?.numSATTestTakers ?? 0
            schools[i].avgSATCriticalReadingScore = schoolSATDict[schools[i].dbn]?.avgSATCriticalReadingScore ?? 0
            schools[i].avgSATWritingScore = schoolSATDict[schools[i].dbn]?.avgSATWritingScore ?? 0
            schools[i].avgSATMathScore = schoolSATDict[schools[i].dbn]?.avgSATMathScore ?? 0
        }
    }

    func sortSchoolsByName() {
        schools.sort { (lhs, rhs) -> Bool in
            return lhs.name < rhs.name
        }
    }

    func sortSchoolsByNeighborhood() {
        schools.sort { (lhs, rhs) -> Bool in
            return (lhs.neighborhood, lhs.name) < (rhs.neighborhood, rhs.name)
        }
    }

    func sortSchoolsByBorough() {
        return schools.sort { (lhs, rhs) -> Bool in
            return (lhs.borough, lhs.neighborhood, lhs.name) < (rhs.borough, rhs.neighborhood, rhs.name)
        }
    }

}
