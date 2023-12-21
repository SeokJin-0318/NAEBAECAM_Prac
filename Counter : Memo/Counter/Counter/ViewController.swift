//
//  ViewController.swift
//  Counter
//
//  Created by 석진 on 12/21/23.
//

import UIKit

class ViewController: UIViewController 
{
    
    @IBOutlet weak var textLabel: UILabel!
    private var count: Int = 0
    
    // 증가 버튼이 눌렸을때
    @IBAction func touchIncreaseButton(_ sender: UIButton)
    {
        self.count += 1
        self.refreshLabel()
    }
    
    // 감소 버튼이 눌렸을때
    @IBAction func touchDecreaseButton(_ sender: UIButton)
    {
        self.count -= 1
        self.refreshLabel()
    }
    
    // 레이블에 count 값을 반영해준다
    private func refreshLabel()
    {
        self.textLabel.text = String(self.count)
    }
    
    // viewDidLoad 생명주기를 활용
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.refreshLabel()
    }
    
}

