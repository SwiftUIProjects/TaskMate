//
//  SearchBar.swift
//  TaskMate
//
//  Created by Swapna Botta on 24/06/26.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField("Search tasks...", text: $searchText)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 44)
        .background(Color.fieldsColour)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4)
        .padding(.horizontal)
    }
}


