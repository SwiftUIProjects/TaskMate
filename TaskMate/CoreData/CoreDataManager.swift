//
//  CoreDataManager.swift
//  TaskMate
//
//  Created by Swapna Botta on 17/06/26.
//

import SwiftUI
import CoreData


final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "Task")
        
        persistentContainer.loadPersistentStores { (desc, error) in
            
            if let error = error{
                print("coredata loading error \(error.localizedDescription)")
            }
        }
    }
    
    func saveTask(model: TaskModel) {
        
        let task = Task(context: persistentContainer.viewContext)
        task.title = model.title
        task.category = model.category
        task.taskdescription = model.description
        task.dueDate = model.dueDate
        task.priority = model.priority.rawValue
        
        do {
           try persistentContainer.viewContext.save()
            let count = fetchTasks().count
                   print("Total Tasks:", count)
        }
        catch{
            print("data save failed \(error.localizedDescription)")
        }
        
    }
    
    //better for MVVM using seperate TaskModel
    func fetchTasks() -> [TaskModel] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            let tasks = try persistentContainer.viewContext.fetch(fetchRequest)
            return tasks.map { task in
                TaskModel(
                    objectID: task.objectID,
                    title: task.title ?? "",
                    category: task.category ?? "",
                    description: task.taskdescription ?? "",
                    dueDate: task.dueDate ?? Date(),
                    priority: TaskPriority(rawValue: task.priority ?? "") ?? .medium
                )
            }
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
    
    func deleteTask(taskModel: TaskModel) {

        guard let objectId = taskModel.objectID else { return }
        
        do {
            let task = try persistentContainer.viewContext.existingObject(
                with: objectId
            )
            
            persistentContainer.viewContext.delete(task)

            try persistentContainer.viewContext.save()

        } catch {
            print("Delete failed: \(error)")
        }
    }
    
    // MARK: - With entity model

    //if we want we can also fetch directly from coredata entity model
    func fetchTasksWithEntity() -> [Task] {
        
        let fetchRequest:NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            print("tasks list: \(try persistentContainer.viewContext.fetch(fetchRequest))")
            return try persistentContainer.viewContext.fetch(fetchRequest)
            
        }
        catch {
            return []
        }
        
    }
    
}
