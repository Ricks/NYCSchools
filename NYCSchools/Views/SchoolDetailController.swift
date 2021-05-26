//
//  SchoolDetailController.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/25/21.
//

import UIKit

class SchoolDetailController: UIViewController, Storyboarded {

    @IBOutlet var schoolNameLabel: UILabel!
    @IBOutlet var boroughLabel: UILabel!
    @IBOutlet var neighborhoodLabel: UILabel!
    @IBOutlet var dbnLabel: UILabel!
    @IBOutlet var numSATTakersLabel: UILabel!
    @IBOutlet var avgSATReadingScoreLabel: UILabel!
    @IBOutlet var avgSATWritingScoreLabel: UILabel!
    @IBOutlet var avgSATMathScoreLabel: UILabel!
    weak var coordinator: MainCoordinator?

    var school: School? {
        didSet {
            configure()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        guard let school = school else { return }
        schoolNameLabel?.text = school.name
        boroughLabel?.text = school.borough
        neighborhoodLabel?.text = school.neighborhood
        dbnLabel?.text = school.dbn
        numSATTakersLabel?.text = school.numSATTestTakers != nil ? String(school.numSATTestTakers!) : "-"
        avgSATReadingScoreLabel?.text = school.avgSATReadingScore != nil ? String(school.avgSATReadingScore!) : "-"
        avgSATWritingScoreLabel?.text = school.avgSATWritingScore != nil ? String(school.avgSATWritingScore!) : "-"
        avgSATMathScoreLabel?.text = school.avgSATMathScore != nil ? String(school.avgSATMathScore!) : "-"
    }

}
