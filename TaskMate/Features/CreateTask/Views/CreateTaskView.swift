//
//  TaskDetailsView.swift
//  TaskMate
//
//  Created by Swapna Botta on 15/06/26.
//

import SwiftUI

struct CreateTaskView: View {
    
    @Environment(\.dismiss) var dismiss

    @StateObject var viewModel = CreateTaskViewModel()

    var body: some View {
        
        ZStack(alignment: .top) {

            HeaderView(screenTitle: "Create Task", isBackButtonNeed: true)
            
            contentView

        }
        .background(Color.taskBackgroundColour)
        .alert("", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {
                dismiss()
            }
        } message: {
            Text("You will be notified on \(viewModel.task.dueDate.formatted())")
        }
    }
}



#Preview {
    NavigationStack {
        CreateTaskView()
    }
}




extension CreateTaskView {
    
    @ViewBuilder var contentView: some View {
        
        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                DropdownMenu(
                    title: "Select Category",
                    items: viewModel.categories,
                    selected: $viewModel.task.category
                )

                textFields

                datePicker

                prioritySegment

                darkMode

                createButtonAction
            }
            .padding(20)
            .background(Color.taskBackgroundColour)
            .clipShape(
                RoundedRectangle(cornerRadius: 25)
            )
        }
        .padding(.top, 70)

    }
   
}
