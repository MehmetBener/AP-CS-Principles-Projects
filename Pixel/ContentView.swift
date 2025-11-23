import SwiftUI

struct ContentView: View {
    let cells = Array(0..<100)
    
    @State private var cellColors: [Color] = Array(repeating: .gray, count: 100)
    
    @State private var inputText: String = ""
    
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Pixel Painter 10×10")
                .font(.title)
            
            drawGrid()
                .padding(4)
            
            HStack {
                TextField("Enter cell (0–99)", text: $inputText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                
                Button("Paint") {
                    changeColor()
                }
                .padding(.horizontal, 8)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func drawGrid() -> some View {
        VStack(spacing: 2) {
            ForEach(0..<10) { row in
                HStack(spacing: 2) {
                    ForEach(0..<10) { col in
                        let index = row * 10 + col
                        
                        Rectangle()
                            .fill(cellColors[index])
                            .frame(width: 24, height: 24)
                            .overlay(
                                Text("\(index)")
                                    .font(.system(size: 8))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
        }
    }
    
    func changeColor() {
        if let index = Int(inputText), index >= 0, index < 100 {
            cellColors[index] = .blue
            errorMessage = ""
        } else {
            errorMessage = "Invalid input. Please enter a number from 0 to 99."
        }
    }
}
