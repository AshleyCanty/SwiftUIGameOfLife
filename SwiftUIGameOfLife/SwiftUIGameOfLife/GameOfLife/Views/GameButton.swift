//
//  GameButton.swift
//  SwiftUIGameOfLife
//
//  Created by ashley canty on 1/31/24.
//

import SwiftUI


struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        GameButton(config: configuration)
    }
}

fileprivate struct GameButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    let config: ButtonStyleConfiguration
    
    var body: some View {
        config.label
            .font(.body)
            .padding()
            .foregroundStyle(isEnabled ? .white : .secondary.opacity(0.3))
            .frame(maxHeight: 60)
            .shadow(color: Color.orange.opacity(0.2), radius: 15, y: 5)
            .background(RoundedRectangle(cornerRadius: 12).fill(isEnabled ? .orange : .gray.opacity(0.5)))
    }
}
