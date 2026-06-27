//
//  CreateTaskViewModel.swift
//  TaskMate
//
//  Created by Swapna Botta on 24/06/26.
//


import CoreData
import SwiftUI

class CreateTaskViewModel: ObservableObject {
    
    let coreData = CoreDataManager.shared
    
    @Published var task = TaskModel()

    @Published var showAlert   = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    @Published var categories = [
        "Work",
        "Study",
        "Personal",
        "Health",
        "Finance",
        "Shopping",
        "Family",
        "Travel",
        "Goals",
        "Events",
        "Home",
        "Fitness",
        "Meetings",
        "Projects",
        "Bills",
        "Appointments",
        "Learning",
        "Social",
        "Hobbies",
        "Others"
    ]
    

    // MARK: - Validation
    
    var isFormValid: Bool {
        !task.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !task.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
        
    
    // MARK: - Create

    func createTask(){
        
        CoreDataManager.shared.saveTask(model: TaskModel(title: task.title, category: task.category, description: task.description, dueDate: task.dueDate, priority: task.priority))
        
    }

    // MARK: - Notification

    func createTaskAndNotification(){
        
        createTask()

        NotificationManager.shared.scheduleNotification(
            title: task.title,
            body: task.description,
            date: task.dueDate
        )
        showAlert = true
    }
    
    
}
