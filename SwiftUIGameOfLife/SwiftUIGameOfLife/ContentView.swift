//
//  ContentView.swift
//  SwiftUIGameOfLife
//
//  Created by ashley canty on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var game = GameViewModel()
    @State private var shouldAllowGenerations = false
    @State private var didSetSeed = false
    @State private var generationCounter = 0
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            VStack {
                GameView(size: size,
                         game: game,
                         didSetSeed: $didSetSeed,
                         shouldAllowGenerations: $shouldAllowGenerations,
                         generationCounter: $generationCounter)
                
                ControlsView(clearButtonAction: resetGame,
                             nextButtonAction: generateNewLife,
                             shouldAllowGenerations: $shouldAllowGenerations)
            }
        }.background(Gradient(colors: [.teal, .cyan, .mint]).opacity(0.6))
    }
    
    func resetGame() {
        game.resetCells()
        generationCounter = 0
        shouldAllowGenerations = false
        didSetSeed = false
    }
    
    func generateNewLife() {
        if !didSetSeed { didSetSeed = true }
        game.iterate()
        generationCounter += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

