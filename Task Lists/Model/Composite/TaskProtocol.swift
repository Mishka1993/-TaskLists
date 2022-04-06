//
//  TaskProtocol.swift
//  Task Lists
//
//  Created by Михаил Киржнер on 06.04.2022.
//

import Foundation


protocol TaskProtocol {
    
    var name: String {get set}
    
    func countSubTask() -> Int
    func description() -> String
    
}
