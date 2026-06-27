//
//  CoreDataViewModel.swift
//  TaskMate
//
//  Created by Swapna Botta on 17/06/26.
//

import CoreData
import SwiftUI

class TaskListViewModel: ObservableObject {
    
    let coreData = CoreDataManager.shared
    
    @Published var tasks: [TaskModel] = []
    @Published var task = TaskModel()
    @Published var selectedTask: TaskModel?
    @Published var searchText = ""

    var filteredTasks: [TaskModel] {
        if searchText.isEmpty {
            return tasks
        }
        else{
            return tasks.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.priority.rawValue.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    
     init() {
         loadTasks()
     }
     
     // MARK: - Fetch
     func loadTasks() {
         tasks = coreData.fetchTasks()
     }
    
    // MARK: - search filter

    func searchTasks(text: String) {
        
    }
    // MARK: - Delete

    func deleteTask(at offsets: IndexSet) {

        offsets.forEach { index in

            let task = tasks[index]
           
            CoreDataManager.shared.deleteTask(taskModel: task)
        }

        loadTasks()
    }
    
}
