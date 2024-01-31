//
//  ControlsView.swift
//  SwiftUIGameOfLife
//
//  Created by ashley canty on 1/31/24.
//

import SwiftUI

struct ControlsView: View {
    
    var clearButtonAction: () -> Void
    var nextButtonAction: () -> Void
    @Binding var shouldAllowGenerations: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: clearButtonAction) {
                HStack {
                    Image(systemName: "trash.fill")
                    Text("Clear")
                        .padding(.horizontal)
                }
            }
            .buttonStyle(MainButtonStyle())
            
            Button(action: nextButtonAction) {
                HStack {
                    Image(systemName: "arrowtriangle.right.fill")
                    Text("Next step")
                        .padding(.horizontal)
                }
            }
            .disabled(!shouldAllowGenerations)
            .buttonStyle(MainButtonStyle())
        }
    }
}
