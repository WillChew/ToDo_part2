//
//  DataManager.swift
//  Every.Do part 2
//
//  Created by Will Chew on 2018-07-11.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    var context: NSManagedObjectContext!
    
    override init() {}
    
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.context = context
    }
    struct Key {
        static let task = "Task"
    }
    
    internal func getTaskCount() -> Int {
        let request = NSFetchRequest<Task>(entityName: Key.task)
        let result = try! context.count(for: request)
        return result
    }
    
    internal func createTask() {
        let task1 = Task(context: context)
        task1.title = "Go to Class"
        task1.priority = 1
        task1.todoDescription = "Attend lecture and take notes"
    }
    
    private func fetchWithSort() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: Key.task)
        let sortDescriptor = NSSortDescriptor(key: "priority", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let tasks = try! context.fetch(fetchRequest)
        return tasks
    }
    
    internal func task(at indexPath: IndexPath) -> Task {
        let tasks = fetchWithSort()
        return tasks[indexPath.row]
    }
    

    
    
}
