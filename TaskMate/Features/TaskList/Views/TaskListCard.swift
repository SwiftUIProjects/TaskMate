//
//  TaskListCard.swift
//  TaskMate
//
//  Created by Swapna Botta on 15/06/26.
//

import SwiftUI

struct TaskCard: View {
    
    var task: TaskModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(task.title)
                        .font(.title3)
                        .bold()
                    
                    Text(task.description)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.secondary)
                        .padding(.bottom, 15)
                    
                    Content(
                        icon: "folder.fill",
                        text: task.category.isEmpty ? "General" : task.category
                    )
                    
                    Content(
                        icon: "calendar",
                        text: task.dueDate.convertedDate()
                    )
                    
                    Content(
                        icon: "flag.fill",
                        text: task.priority.rawValue,
                        textColor: task.priority.priorityColour
                    )
                }
                
                Spacer()
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(task.priority.priorityColour)
                
            }
            
        }
        .padding()
        .background(Color.taskFieldsColour)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
    
}




struct Content: View {
    
    var icon: String
    var text: String
    var textColor: Color = .primary

    var body: some View {
        
        HStack {
            Image(systemName: icon)
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.taskTitleColour)

            Text(text)
                .font(.system(size: 16))
                .foregroundStyle(textColor)

        }
        
    }
    
}

