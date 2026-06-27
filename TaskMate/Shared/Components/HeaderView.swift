//
//  HeaderView.swift
//  TaskMate
//
//  Created by Swapna Botta on 20/06/26.
//

import SwiftUI

struct HeaderView: View {
    
    var screenTitle: String = ""
    var isBackButtonNeed: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                if isBackButtonNeed {
                    Button {
                        print("back tapped")
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical)

            .overlay {
                Text(screenTitle)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(Color.taskFieldsColour)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)

        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(
            Color.taskTitleColour
                .ignoresSafeArea()
        )
    }
}
