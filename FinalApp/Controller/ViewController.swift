//
//  ViewController.swift
//  FinalAssignment
//
//  Created by IMCS on 9/4/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var artistDataArray = [ArtistData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        JsonApiManager.fetchData{ ( dataArray : [ArtistData] ) in
            
            self.artistDataArray = dataArray
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.artistNameLabel.text = artistDataArray[indexPath.row].artistName
        cell.dateOfRelease.text = artistDataArray[indexPath.row].releasedDate
        return cell
    }
    
}

