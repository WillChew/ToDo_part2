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
    
//    internal func createTask() {
//        let task1 = Task(context: context)
//        task1.title = "Go to Class"
//        task1.priority = 1
//        task1.todoDescription = "Attend lecture and take notes"
//    }
    
    private func fetchWithSort() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: Key.task)
        let sortDescriptor = NSSortDescriptor(key: "priority", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let tasks = try! context.fetch(fetchRequest)
        return tasks
    }
    
    internal func task(at indexPath: IndexPath) -> Task {
        let tasks = fetchWithSort()
        return tasks[indexPath.row]
    }
    
    internal func addTask(_ title: String, desc: String, priority: Int16) {
        let task = Task(context: context)
        task.title = title
        task.todoDescription = desc
        task.priority = priority
        saveContext()
    }
    
    internal func deleteTask(at indexPath: IndexPath) {
      var tasks = fetchWithSort()
        tasks.remove(at: indexPath.row)
        saveContext()
    }
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    
    
    
}
