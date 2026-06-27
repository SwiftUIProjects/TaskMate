//
//  TaskList.swift
//  TaskMate
//
//  Created by Swapna Botta on 15/06/26.
//

import SwiftUI

struct TaskList: View {

    @StateObject var coredataViewmodel = TaskListViewModel()
    
    var body: some View {

        NavigationStack {

            ZStack(alignment: .top) {

                HeaderView(screenTitle: "Task List")
                
                SearchBar(searchText: $coredataViewmodel.searchText)
                    .padding(.top, 40)

                contentView
                    .padding(.top, 90)
            }
            .background(Color.taskBackgroundColour)
            .onAppear {
                coredataViewmodel.loadTasks()
            }
        }
    }

}

#Preview {
    TaskList()
}

