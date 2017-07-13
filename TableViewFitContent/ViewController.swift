//
//  ViewController.swift
//  TableViewFitContent
//
//  Created by Jay Liew on 7/3/17.
//  Copyright © 2017 Jay Liew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeightConstraint: NSLayoutConstraint!
    
    let data = ["this is a short line.",
                "<start 1st> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint. deserunt mollit anim id est laborum. <end 1st>",
                "another short line.",
                "<start 2nd> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia. <end 2nd>"
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
    } // viewDiDload
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var tableViewHeightShouldBe:CGFloat = 0.0
        
        for cell in tableView.visibleCells{
            //print(cell.frame.height)
            tableViewHeightShouldBe = tableViewHeightShouldBe + cell.frame.height
        }
        
        print("tableViewHeightShouldBe \(tableViewHeightShouldBe)")
        tableViewHeightConstraint.constant = tableViewHeightShouldBe
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCell
        cell.cellLabel?.text = data[indexPath.row]
        return cell
    }
    
}

