//
//  SchoolListController.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import UIKit

class SchoolListController: UIViewController, UITableViewDataSource, UITableViewDelegate, Storyboarded {

    @IBOutlet var schoolTable: UITableView!
    let schoolModel = SchoolModel()
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        schoolModel.sortSchoolsByName()
        schoolTable.reloadData()
    }

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolModel.schools.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell", for: indexPath) as! SchoolTableViewCell
        let school = schoolModel.schools[indexPath.row]
        cell.schoolNameLabel.text = school.name
        cell.boroughLabel.text = school.borough
        cell.neighborhoodLabel.text = school.neighborhood
        return cell
    }
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.schoolSelected(schoolModel.schools[indexPath.row])
    }

    // MARK: - Button callbacks

    @IBAction func schoolNameButtonPressed(_ sender: Any) {
        schoolModel.sortSchoolsByName()
        schoolTable.reloadData()
    }

    @IBAction func boroughButtonPressed(_ sender: Any) {
        schoolModel.sortSchoolsByBorough()
        schoolTable.reloadData()
    }

    @IBAction func neighborhoodButtonPressed(_ sender: Any) {
        schoolModel.sortSchoolsByNeighborhood()
        schoolTable.reloadData()
    }

}
