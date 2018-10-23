//
//  ViewController.swift
//  LargeTitleIssueTestiOS
//
//  Created by Sam Rowley on 23/10/2018.
//  Copyright © 2018 Travel Counsellors. All rights reserved.
//

import UIKit

protocol HideableHairlineViewController {
    func hideHairline()
    func showHairline()
}

extension HideableHairlineViewController where Self: UIViewController {
    func hideHairline() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showHairline() {
        self.navigationController?.navigationBar.shadowImage = nil
    }
}

class ViewController: UIViewController, HideableHairlineViewController {
    
    @IBOutlet weak var segmentationControl: UISegmentedControl!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        
        toolbar.delegate = self
        
        self.navigationItem.hidesBackButton = true
        
        self.title = "Title"
        
        tableView.dataSource = self
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideHairline()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        showHairline()
    }


}


extension ViewController: UIToolbarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
        cell.cellLabel.text = String(indexPath.row)
        return cell
    }
}
