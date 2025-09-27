// Mehmet Bener - AP CS P - Binary-Decimal Converter
import SwiftUI

func decimalToBinary(_ number: Int) -> String {
    if number == 0 { return "0" }
    var num = number
    var binary = ""
    while num > 0 {
        let remainder = num % 2
        binary = String(remainder) + binary
        num = num / 2
    }
    return binary
}

func padded4Bit(_ number: Int) -> String {
    let n = ((number % 16) + 16) % 16
    let raw = decimalToBinary(n)
    return String(repeating: "0", count: max(0, 4 - raw.count)) + raw
}

struct ContentView: View {
    @State private var id: Int = 0
    @State private var showOverflow = false
    private let weights = [8, 4, 2, 1]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("4-bit Student ID")
                .font(.title.bold())
            
            Text("Decimal: \(id)")
                .font(.title2)
            
            Text("Binary: \(padded4Bit(id))")
                .font(.title3).monospaced()
            
            HStack(spacing: 12) {
                ForEach(weights, id: \.self) { w in
                    let bitOn = (id & w) == w
                    Rectangle()
                        .fill(bitOn ? Color.green : Color.gray.opacity(0.25))
                        .frame(width: 56, height: 64)
                        .overlay(
                            VStack(spacing: 6) {
                                Text(bitOn ? "1" : "0")
                                    .font(.headline).monospaced()
                                Text("\(w)")
                                    .font(.caption).foregroundColor(.black.opacity(0.6))
                            }
                        )
                        .cornerRadius(10)
                }
            }
            
            if showOverflow {
                Text("OVERFLOW!")
                    .font(.headline)
                    .foregroundColor(.red)
                    .transition(.opacity)
            }
            
            HStack(spacing: 16) {
                Button("Enroll (+1)") {
                    let was15 = (id == 15)
                    id = (id + 1) & 0xF  // wrap 0–15
                    withAnimation { showOverflow = was15 }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                        withAnimation { showOverflow = false }
                    }
                }
                .buttonStyle(.bordered)
                
                Button("Reset (0)") {
                    withAnimation {
                        id = 0
                        showOverflow = false
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(.top, 8)
            
            HStack {
                ForEach([3, 7, 12, 15], id: \.self) { preset in
                    Button("Set \(preset)") { id = preset }
                        .buttonStyle(.bordered)
                }
            }
        }
        .padding()
    }
}

