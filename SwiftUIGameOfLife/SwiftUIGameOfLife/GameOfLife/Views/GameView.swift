//
//  ContentView.swift
//  SwiftUIGameOfLife
//
//  Created by ashley canty on 1/28/24.
//

import SwiftUI

struct GameView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: GameViewModel.dimension)
    
    var size: CGSize
    @ObservedObject var game: GameViewModel
    @Binding var didSetSeed: Bool
    @Binding var shouldAllowGenerations: Bool
    @Binding var generationCounter: Int
    
    
    var body: some View {
        VStack {
            Text("Generation: \(generationCounter)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding([.top, .bottom], 20)
                .foregroundColor(.white)
            
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(0..<game.cells.count, id: \.self) { row in
                    ForEach(0..<self.game.cells[row].count) { column in
                        let itemSize = (size.width - 40)/10.0
                        CellView(cell: $game.cells[row][column], didSetSeed: $didSetSeed, shouldAllowGenerations: $shouldAllowGenerations).frame(width: itemSize, height: itemSize)
                    }
                }
            }
            .padding(15)
        }
    }
}

