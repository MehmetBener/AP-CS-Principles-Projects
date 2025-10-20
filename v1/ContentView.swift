import SwiftUI

struct ContentView: View {
    private let grid_size = 10
    let circleDiameter: CGFloat = 24
    let circleSpacing: CGFloat = 6
    
    let fillColor: Color = .red
    let emptyColor: Color = Color.gray.opacity(0.15)
    let background: Color = Color(.systemBackground)
    
    var body: some View {
        ZStack {
            HStack(spacing: 24) {
                LetterGridView(
                    letter: "M",
                    gridSize: grid_size,
                    circleDiameter: circleDiameter,
                    circleSpacing: circleSpacing,
                    fillColor: fillColor,
                    emptyColor: emptyColor
                )
                LetterGridView(
                    letter: "B",
                    gridSize: grid_size,
                    circleDiameter: circleDiameter,
                    circleSpacing: circleSpacing,
                    fillColor: fillColor,
                    emptyColor: emptyColor
                )
            }
            .padding(24)
        }
    }
}

struct LetterGridView: View {
    let letter: Character
    let gridSize: Int
    let circleDiameter: CGFloat
    let circleSpacing: CGFloat
    let fillColor: Color
    let emptyColor: Color
    
    var body: some View {
        VStack(spacing: circleSpacing) {
            ForEach(0..<gridSize, id: \.self) { row in
                HStack(spacing: circleSpacing) {
                    ForEach(0..<gridSize, id: \.self) { col in
                        let filled = isFilled(letter: letter, row: row, col: col)
                        Circle()
                            .fill(filled ? fillColor : emptyColor)
                            .frame(width: circleDiameter, height: circleDiameter)
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

private func isFilled(letter: Character, row: Int, col: Int) -> Bool {
    let m = letter == "M"
    let b = letter == "B"
    if m && (col == 0 || col == 9) { return true }
    if m && row <= 4 && (col == row || col == 9 - row) { return true }
    if b && col == 0 { return true }
    if b && (row == 0 || row == 4 || row == 5 || row == 9) && col <= 7 { return true }
    if b && (1...3).contains(row) && (col == 7 || col == 8) { return true }
    if b && (6...8).contains(row) && (col == 7 || col == 8) { return true }
    return false
}
