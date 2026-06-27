//
//  FormFieldView.swift
//  TaskMate
//
//  Created by Swapna Botta on 16/06/26.
//

import SwiftUI


extension CreateTaskView {
    
    @ViewBuilder var textFields: some View {
        
        FormFieldView(
            title: "Add Task Title",
            text: $viewModel.task.title,
            placeholder: "Finish SwiftUI project",
            isRequired: true
        )

        FormFieldView(
            title: "Add Brief Description",
            text: $viewModel.task.description,
            placeholder: "Describe the task...",
            isRequired: true
        )
        
    }
    
    @ViewBuilder var datePicker: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 2) {
                Text("Select Date & Time")
                    .font(.headline)

                Text("*")
                    .foregroundStyle(.red)
            }
            
            DatePicker(
                "",
                selection: $viewModel.task.dueDate,
                in: Calendar.current.startOfDay(for: Date())...,
                displayedComponents: [.date, .hourAndMinute]

            )
            .labelsHidden()
            .frame(height: 50)
            .background(Color.taskFieldsColour)

        }
        
    }
    
    @ViewBuilder var prioritySegment: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 2) {
                Text("Select Priority")
                    .font(.headline)

                Text("*")
                    .foregroundStyle(.red)
            }

            
            Picker("Priority", selection: $viewModel.task.priority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
            .background(Color.taskFieldsColour)

            .pickerStyle(.segmented)
        }
    }
    
    @ViewBuilder var createButtonAction: some View {
        
        HStack {
            Spacer()
            Button {
                viewModel.createTaskAndNotification()
            } label: {
                Text("Create")
            }
            .frame(width: 200, height: 50)
            .background(
                viewModel.isFormValid
                    ? Color.taskButtonColour
                    : Color.gray
            )
            .foregroundStyle(.white)
            .font(.system(size: 20).bold())
            .cornerRadius(20)
            .disabled(!viewModel.isFormValid)
            .opacity(viewModel.isFormValid ? 1 : 0.5)
            Spacer()
        }
        .padding(.top, 50)
        
    }
    
    
    @ViewBuilder var darkMode: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Select Mode")
                .font(.headline)
            
            Toggle(isOn: $viewModel.isDarkMode) {
                Text("Dark Mode")
            }
        }
    }
}










struct FormFieldView: View {

    let title: String
    @Binding var text: String
    var placeholder: String
    var isRequired: Bool = false

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack(spacing: 2) {
                Text(title)
                    .font(.headline)

                if isRequired {
                    Text("*")
                        .foregroundStyle(.red)
                        .font(.headline)
                }
            }

            TextField(placeholder, text: $text)
                .frame(height: 50)
                .padding(.horizontal, 12)
                .background(Color.taskFieldsColour)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
