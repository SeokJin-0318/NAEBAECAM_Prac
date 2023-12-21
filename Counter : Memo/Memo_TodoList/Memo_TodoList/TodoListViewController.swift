//
//  TodoListViewController.swift
//  Memo_TodoList
//
//  Created by 석진 on 12/21/23.
//

import UIKit

class TodoListViewController: UIViewController
{
    @IBOutlet weak var todoListTable: UITableView!
    
    
    private struct Todo
    {
        var index: Int
        var isDone: Bool
        var work: String
    }
    
    private var list: [Todo] = [
    Todo(index: 0, isDone: false, work: "할 일 1"),
    Todo(index: 1, isDone: true, work: "할 일 2"),
    Todo(index: 2, isDone: false, work: "할 일 3")
    ]
    
    @IBAction func addAlert(_ sender: Any)
    {
        let alert = UIAlertController(title: "알림", message: "할 일을 추가하시겠습니까?", preferredStyle: .actionSheet)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        // 확인을 눌렀을 경우
        alert.addTextField{ UITextField in UITextField.placeholder = " 할 일을 입력하세요" }
        
        let addTodo = UIAlertAction(title: "할 일 추가", style: .default, handler: nil)
        
        // 텍스트 입력 받은 후 리스트에 추가
        if let newWork = alert.textFields?.first?.text, !newWork.isEmpty
        {
            let newTodo = Todo(index: self.list.count, isDone: false, work: newWork)
            self.list.append(newTodo)
            
            self.todoListTable.reloadData()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(addTodo)
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
        
        
        let close = UIAlertAction(title: "닫기", style: .destructive, handler: nil)
        alert.addAction(confirm)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
   override func viewDidLoad()
    {
        super.viewDidLoad()
        todoListTable.delegate = self
        todoListTable.dataSource = self
        todoListTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
}


extension TodoListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = todoListTable.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        
        let todos = list[indexPath.row].work
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        print("Selected: \(list[indexPath.row].work)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
