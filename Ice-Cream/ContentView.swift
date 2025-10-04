// Mehmet Bener - AP CS P - Ice Cream App
import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State private var scoops = 0    // how many scoops are on the cone
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Scoops: \(scoops)")
                .font(.title2)
            
            ZStack(alignment: .bottom) {
                Triangle()
                    .fill(.brown)
                    .frame(width: 120, height: 150)
                
                // Draw scoops with a simple loop
                VStack(spacing: -20) {
                    ForEach(0..<scoops, id: \.self) { i in
                        Circle()
                            .fill(colors[i % colors.count])
                            .frame(width: 80, height: 80)
                            .overlay(Text("\(i+1)").foregroundColor(.white))
                    }
                }
                .offset(y: -40)
            }
            .frame(height: 300)
            
            HStack {
                Button("Add Scoop") {
                    if scoops < 5 {
                        scoops += 1
                    } else {
                        print("Overflow → reset to 0")
                        scoops = 0
                    }
                }
                Button("Reset") {
                    scoops = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    // just some fun colors for scoops
    let colors: [Color] = [.pink, .yellow, .mint, .orange, .purple]
}

#Preview {
    ContentView()
}
