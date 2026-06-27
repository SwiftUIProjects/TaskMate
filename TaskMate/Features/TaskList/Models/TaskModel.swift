//
//  TaskModel.swift
//  TaskMate
//
//  Created by Swapna Botta on 17/06/26.
//
import SwiftUI
import CoreData

struct TaskModel: Identifiable, Hashable {

    var id = UUID()
    var objectID: NSManagedObjectID?//added for delete task with unique current id

    var title: String = ""
    var category: String = ""
    var description: String = ""
    var dueDate: Date = Date()
    var priority = TaskPriority.medium
}

enum TaskPriority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
    
    var priorityColour: Color {
        switch self {
            
        case .high :
            return Color.red
            
        case .medium :
            return Color.orange
            
        case .low :
            return Color.brown

            
        }
    }
    
}
