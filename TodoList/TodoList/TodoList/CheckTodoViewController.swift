//
//  ViewController.swift
//  TodoList
//
//  Created by 석진 on 1/9/24.
//

import UIKit

var todoList: [Todo] = []
var selectedCell: CheckTodoTableViewCell?


class CheckTodoViewController: UIViewController
{
    @IBOutlet weak var CheckTodo: UITableView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadData()
        
        CheckTodo.delegate = self
        CheckTodo.dataSource = self
    }
    
    @IBAction func didTapAdd(_ sender: Any)
    {
        let alertController = UIAlertController(title: "할 일 추가",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField 
        {
            textField in textField.placeholder = "할 일을 입력하세요"
            
        alertController.addTextField 
            { textField in textField.placeholder = "카테고리를 입력하세요"
            }
        }
        
        let addAction = UIAlertAction(title: "추가",
                                      style: .default) { [weak self] _ in
            guard let self else { return }
            if let title = alertController.textFields?.first?.text, !title.isEmpty,
               let category = alertController.textFields?.last?.text, !category.isEmpty
            {
                let newItem = Todo(title: title, category: category, isCompleted: false)
                todoList.append(newItem)
                self.CheckTodo.insertRows(at: [IndexPath(row: todoList.count-1, section: 0)], with: .automatic)
                self.saveData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func saveData()
    {
        // Todo 구조체 배열을 UserDefaults에 저장
        let todoData = todoList.map { ["title": $0.title, "category": $0.category, "isCompleted": $0.isCompleted] }
        UserDefaults.standard.set(todoData, forKey: "todoList")
    }
        
    func loadData() 
    {
        // UserDefaults에서 데이터를 읽어와서 todoList 배열에 할당
        if let todoData = UserDefaults.standard.array(forKey: "todoList") as? [[String: Any]] 
        {
            todoList = todoData.compactMap { dict in
                guard let title = dict["title"] as? String,
                      let category = dict["category"] as? String,
                      let isCompleted = dict["isCompleted"] as? Bool 
                else
                {
                    return nil // 하나라도 nil이면 해당 항목은 무시하고 nil 반환
                }
                return Todo(title: title, category: category, isCompleted: isCompleted)
            }
        }
    }


    override func viewDidAppear(_ animated: Bool)
    {
        saveData()
    }
    
}


class CheckTodoTableViewCell: UITableViewCell
{
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    var todo: Todo?
        
    @IBAction func switchChanged(_ sender: UISwitch)
    {
        let switchKey = "switchState_\(sender.tag)"
        UserDefaults.standard.set(doneSwitch.isOn, forKey: switchKey)
            
            
        guard let todo else { return }
            
        if doneSwitch.isOn
        {
            todoLabel.attributedText = todo.title.strikeThrough()
        }
            
        else
        {
            todoLabel.text = todo.title
        }
    }
        
    func setTask(_ _todo: Todo)
    {
        todo = _todo
        guard let todo else { return }
        
        if todo.isCompleted
        {
            todoLabel.attributedText = todo.title.strikeThrough()
        }
        
        else
        {
            todoLabel.text = todo.title
        }
        doneSwitch.isOn = todo.isCompleted
    }
}


extension CheckTodoViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedCell = tableView.cellForRow(at: indexPath) as? CheckTodoTableViewCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
        } else if section == 1 {
        } else {
        }
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = CheckTodo.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CheckTodoTableViewCell
        cell.setTask(todoList[indexPath.row])
        if indexPath.section == 0 {
        } else if indexPath.section == 1 {
        } else {
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let key = "todoList_\(indexPath.row)"
            UserDefaults.standard.removeObject(forKey: key)
            
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData()
        }
    }
    
    
}
