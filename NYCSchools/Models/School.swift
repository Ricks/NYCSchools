//
//  School.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/21/21.
//

import Foundation

struct School: Decodable {
    var name: String = ""
    var dbn: String = ""
    var borough: String = ""
    var neighborhood: String = ""
    var urlString: String = ""
    var numSATTestTakers: Int = 0
    var avgSATCriticalReadingScore: Int = 0
    var avgSATWritingScore: Int = 0
    var avgSATMathScore: Int = 0
}
