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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint. deserunt mollit anim id est laborum.",
                "another short line.",
                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam  explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia."
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
    } // viewDiDload

    override func viewDidAppear(_ animated: Bool) {
        var newFrame = self.tableView.frame;
        newFrame.size.height = self.tableView.contentSize.height;
        self.tableView.frame = newFrame;
        print("viewDidAppear: tableView contentSize w: \(tableView.contentSize.width) h: \(tableView.contentSize.height)")
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeightConstraint.constant = self.tableView.contentSize.height
        print("viewWillLayoutSubviews: tableView contentSize w: \(tableView.contentSize.width) h: \(tableView.contentSize.height)")
    }

    override func viewWillAppear(_ animated: Bool) {
        //tableView.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCell
        cell.cellLabel?.text = data[indexPath.row]
        
        print("cell \(indexPath.row) height is: \(cell.frame.height)")
        
        return cell
    }
    
}
