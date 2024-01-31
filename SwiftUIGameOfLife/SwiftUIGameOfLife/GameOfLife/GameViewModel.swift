//
//  Game.swift
//  ConwayGameOfLife
//
//  Created by ashley canty on 1/26/24.
//

import Foundation
import SwiftUI
import Combine


final class GameViewModel: ObservableObject {
    
    static let dimension: Int = 10
    
    @Published var cells: [[Cell]] = Array(repeating: Array(repeating: Cell(), count: GameViewModel.dimension), count: GameViewModel.dimension)
    
    func iterate() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            var newCells = cells
            let numberOfRows = cells.count
            let numberOfColumns = cells[0].count
            
            for row in 0..<numberOfRows {
                for column in 0..<numberOfColumns {
                    let cell = cells[row][column]
                    let neighbors = self.neighbors(ofRow: row, andColumn: column)
                    let livingNeighbors = neighbors.filter { $0.isAlive }.count
                    
                    if cell.isAlive {
                        if 2...3 ~= livingNeighbors {
                            newCells[row][column].isAlive = true
                        } else {
                            newCells[row][column].isAlive = false
                        }
                    } else if livingNeighbors == 3 {
                        newCells[row][column].isAlive = true
                    }
                }
            }
            
            self.cells = newCells
        }
    }
        
    private func neighbors(ofRow row: Int, andColumn column: Int) -> [Cell] {
        let numberOfRows = cells.count
        let numberOfColumns = cells[0].count
        var neighboringCells = [Cell]()
        
        for i in max(0, row - 1)...min(row + 1, numberOfRows - 1) {
            for j in max(0, column - 1)...min(column + 1, numberOfColumns - 1) {
                if !(i == row && j == column) {
                    neighboringCells.append(cells[i][j])
                }
            }
        }
        return neighboringCells
    }
    
    func resetCells() {
        cells = Array(repeating: Array(repeating: Cell(), count: GameViewModel.dimension), count: GameViewModel.dimension)
    }
}
