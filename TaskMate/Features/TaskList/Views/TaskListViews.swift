//
//  TaskListContent.swift
//  TaskMate
//
//  Created by Swapna Botta on 25/06/26.
//

import SwiftUI


extension TaskList {
    
    @ViewBuilder
    var contentView: some View {
        Group {
            if coredataViewmodel.tasks.isEmpty {
                
                EmptyStateView(
                    icon: "target",
                    title: "No Tasks Yet",
                    message: "Tap the + button to create your first task."
                )
                
            } else if coredataViewmodel.filteredTasks.isEmpty {
                
                EmptyStateView(
                    icon: "doc.text.magnifyingglass",
                    title: "No Results Found",
                    message: "Try searching with a different keyword."
                )
                
            } else {
                
                ListView
            }
        }
        .overlay(alignment: .bottomTrailing) {
            addButton
                .padding()
        }
    }
    
    @ViewBuilder var ListView: some View {
        
        if coredataViewmodel.filteredTasks.count == 0{
            EmptyStateView(
                icon: "magnifyingglass.circle.fill",
                title: "No Results Found",
                message: "Try searching with a different keyword."
            )
        }
        else {
        List {
            ForEach(coredataViewmodel.filteredTasks) { task in
                TaskCard(task: task)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        coredataViewmodel.selectedTask = task
                    }
            }
            .onDelete(perform: coredataViewmodel.deleteTask)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
        }
        .contentMargins(.top, 0)
        
        .navigationDestination(item: $coredataViewmodel.selectedTask) { task in
            CreateTaskView()
            
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
    }
    }
    
    @ViewBuilder var addButton: some View {
        NavigationLink {
            CreateTaskView()
        } label: {
            Image(systemName: "plus")
                .font(.title2.bold())
                .foregroundStyle(.white)
                .frame(width: 70, height: 70)
                .background(Color.taskButtonColour)
                .clipShape(Circle())
                .shadow(radius: 8)
        }
        .padding(.trailing, 40)
        .padding(.bottom, 30)
        .buttonStyle(.plain)
    }
    
}
