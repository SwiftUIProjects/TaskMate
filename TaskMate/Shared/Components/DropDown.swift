//
//  DropDown.swift
//  TaskMate
//
//  Created by Swapna Botta on 16/06/26.
//

import SwiftUI

struct DropdownMenu: View {
    let title: String?
    let items: [String]
    @Binding var selected: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title ?? "")
                .font(.headline)
            
            Menu {
                ForEach(items, id: \.self) { item in
                    Button(item) {
                        selected = item
                    }
                }
            } label: {
                HStack {
                    Text(selected.isEmpty ? title ?? "" : selected)
                        .foregroundColor(selected.isEmpty ? .secondary : .primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .frame(height: 50)
                .padding(.horizontal, 12)
                .background(Color.taskFieldsColour)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}
