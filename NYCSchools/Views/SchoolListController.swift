//
//  SchoolListController.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import UIKit

class SchoolListController: UITableViewController, Storyboarded {

    @IBOutlet var schoolTable: UITableView!
    let schoolModel = SchoolModel()
    weak var coordinator: MainCoordinator?

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolModel.schools.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell", for: indexPath) as! SchoolTableViewCell
        let school = schoolModel.schools[indexPath.row]
        cell.schoolNameLabel.text = school.name
        cell.boroughLabel.text = school.borough
        cell.neighborhoodLabel.text = school.neighborhood
        return cell
    }

}
