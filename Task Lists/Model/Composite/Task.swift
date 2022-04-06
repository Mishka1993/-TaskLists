//
//  Task.swift
//  Task Lists
//
//  Created by Михаил Киржнер on 06.04.2022.
//

import Foundation


class Task: TaskProtocol {
    
    var name: String
    var tasks: [TaskProtocol] = []
    
    init(_ name: String) {
        self.name = name
    }
    
    func countSubTask() -> Int {
        tasks.count
    }
    
    func description() -> String {
        let cn = countSubTask() + tasks.compactMap { $0.countSubTask() }.reduce(0, +)
        return "\(cn)"
    }
    
}
