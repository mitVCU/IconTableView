//
//  ViewController.swift
//  IconTableView
//
//  Created by Mit Amin on 12/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(IconTableViewCell.nib(), forCellReuseIdentifier: IconTableViewCell.identifier)
        
        configureGradientBackground()
    }
    
    func configureGradientBackground() {
        let gradientBackgroundColors = [
            UIColor.red.cgColor,
            UIColor.blue.cgColor
        ]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = [0, 1]

        gradientLayer.frame = tableview.bounds
        let backgroundView = UIView(frame: tableview.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableview.backgroundView = backgroundView
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? IconTableViewCell else { return }
        cell.setIcon(place: .burrito)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: IconTableViewCell.identifier) as? IconTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

