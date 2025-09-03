// Mehmet Bener - AP CS P - Calculator that takes two num inputs and adds, subtracts, multiplies and divides the numbers and displays the result.
import SwiftUI

struct ContentView: View {
    @State private var n1 = ""
    @State private var n2 = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("👾🧑🏼‍✈️🦹🏼‍♂️Calculator💎🛞🛵")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 12)
                
                VStack(spacing: 14) {
                    TextField("Enter Number 1", text: $n1)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Enter Number 2", text: $n2)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .shadow(radius: 6)
                }
                .padding(.horizontal, 28)
                
                let num1 = Double(n1) ?? 0
                let num2 = Double(n2) ?? 0
                let add = num1 + num2
                let subtract = num1 - num2
                let multiple = num1 * num2
                let div = num1 / num2
                
                VStack(spacing: 16) {
                    HStack {
                        Text("➕ Addition")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.purple)
                        Spacer()
                        Text("\(add)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("➖ Subtraction")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.purple)
                        Spacer()
                        Text("\(subtract)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("✖️ Multiplication")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.purple)
                        Spacer()
                        Text("\(multiple)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("➗ Division")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.purple)
                        Spacer()
                        Text(num2 == 0 ? "—" : String(div))
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.95))
                .cornerRadius(18)
                .shadow(radius: 10)
                .padding(.horizontal, 28)
                
                Spacer()
            }
            .multilineTextAlignment(.center)
        }
    }
}
