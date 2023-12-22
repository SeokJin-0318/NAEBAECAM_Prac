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
    
    var todoList: [Todo] = 
    [
    Todo(index: 0, isDone: false, work: "할 일 1"),
    Todo(index: 1, isDone: true, work: "할 일 2"),
    Todo(index: 2, isDone: false, work: "할 일 3"),
    Todo(index: 3, isDone: false, work: "할 일 4")
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        super.viewWillAppear(animated)
        self.todoListTable?.reloadData()
    }
    
    
    @IBAction func addAlert(_ sender: Any)
        {
            let alertController = UIAlertController(title: "알림", message: nil, preferredStyle: .alert)
            alertController.addTextField{ textField in textField.placeholder = "할 일을 입력하세요"}
            
            let addTodo = UIAlertAction(title: "추가", style: .default) { [weak self] _ in guard let self else{return}
                
                // 텍스트 입력 받은 후 리스트에 추가
                if let newWork = alertController.textFields?.first?.text, !newWork.isEmpty
                {
                    let newTodo = Todo(index: (todoList.last?.index ?? -1) + 1, isDone: false, work: newWork)
                    todoList.append(newTodo)
                    
                    self.todoListTable? .insertRows(at: [IndexPath(row: todoList.count - 1, section: 0)], with: .automatic)
                }
            }
            
            let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alertController.addAction(addTodo)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
        }
}


extension TodoListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return todoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TodoTableViewCell
        
        cell.setTask(todoList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
