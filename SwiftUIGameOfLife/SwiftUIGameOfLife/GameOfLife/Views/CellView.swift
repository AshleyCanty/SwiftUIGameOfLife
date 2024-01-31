//
//  Cell.swift
//  SwiftUIGameOfLife
//
//  Created by ashley canty on 1/30/24.
//

import SwiftUI


struct Cell {
    var isAlive: Bool = false
}

struct CellView: View {
    @Binding var cell: Cell
    @Binding var didSetSeed: Bool
    @Binding var shouldAllowGenerations: Bool
    
    var color: Color {
        cell.isAlive ? .orange : .white
    }
    
    var body: some View {
        Rectangle()
        .fill(color)
        .onTapGesture {
            if !didSetSeed {
                cell.isAlive.toggle()
                shouldAllowGenerations = true
            }
        }
    }
}
