//
//  MyTableViewController.swift
//  PracticeUI
//
//  Created by 석진 on 11/24/23.
//

import UIKit

class MyTableViewController: UIViewController
{
    
    @IBOutlet weak var myTableview: UITableView!
    
    let friendsNames: [String] = ["Henry", "Leeo", "Jay","Key"]
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        myTableview.backgroundColor = .blue
        myTableview.delegate = self
        myTableview.dataSource = self
    }
}


extension MyTableViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return friendsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTableview.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = friendsNames[indexPath.row]
        return cell
    }
}
