//
//  EmptyStateView.swift
//  TaskMate
//
//  Created by Swapna Botta on 24/06/26.
//

import SwiftUI

struct EmptyStateView: View {
    
    var icon: String?
    var title: String
    var message: String
    
    var body: some View {
        VStack(spacing: 18) {
            
            Image(systemName: icon ?? "")
                .font(.system(size: 70))
                .foregroundStyle(Color.taskTitleColour)
            
            Text(title)
                .font(.title2.bold())
            
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//#Preview {
//    EmptyStateView()
//}
