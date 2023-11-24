//
//  ViewController.swift
//  PracticeUI
//
//  Created by 석진 on 11/24/23.
//

import UIKit

struct Familly
{
    let myName: String
    let bestFriendName: String
    let NextFriendName: String
    let myBrother: String
}

class ViewController: UIViewController
{
    
    let friendsNames: [String] = ["Henry", "Leeo", "Jay", "Key"]
    let koreanNames: [String: String] = ["Henry": "헨리", "Leeo": "리오", "Jay": "제이"]
    var count: Int = 0
    let friend = Familly(myName: "Henry2", bestFriendName: "Leeo2", NextFriendName: "Jay2", myBrother: "Key")
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bestFriendNameLabel: UILabel!
    @IBOutlet weak var NextFriendNameLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        
        nameLabel.text = friend.myName
        bestFriendNameLabel.text = friend.bestFriendName
        NextFriendNameLabel.text = friend.NextFriendName
    }
    
}

