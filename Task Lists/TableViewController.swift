//
//  ViewController.swift
//  Task Lists
//
//  Created by Михаил Киржнер on 06.04.2022.
//

import UIKit


class TableViewController: UITableViewController {
    
    private var task = Task("root")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    public func setTask(_ t: Task?) {
        
        guard let task = t else { return }
        self.task = task
        
    }
    
    @IBAction func addNewTask(_: Any) {
        
        let newRowIndex = task.tasks.count
        
        task.tasks.append(Task("Task \(newRowIndex + 1)"))
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        task.tasks.count
    }
    
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = task.tasks[indexPath.row]
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "TaskListViewController") as! Self
        vc.setTask(task as? Task)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = task.tasks[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TaskCell")
        
        var conf = cell.defaultContentConfiguration()
        conf.text = "\(dataCell.name) (\(dataCell.description()))"
        conf.textProperties.color = .systemBlue
        
        conf.image = UIImage(systemName: "folder.fill")
        
        cell.contentConfiguration = conf
        
        return cell
    }
    
}

