import SwiftUI

struct ContentView: View {
    let iceCreamFlavors = ["Vanilla", "Chocolate", "Strawberry", "Mint", "Cookies & Cream"]
    let scoops = [1, 3, 2, 4, 5]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ice Cream Scoops")
                .font(.title)
                .padding(.bottom, 8)
            
            ForEach(0..<iceCreamFlavors.count, id: \.self) { i in
                HStack {
                    Text(iceCreamFlavors[i])
                        .frame(width: 140, alignment: .leading)
                    
                    Rectangle()
                        .frame(width: CGFloat(scoops[i]) * 30,
                               height: 20)
                        .opacity(0.3)
                    
                    Text("\(scoops[i])")
                        .padding(.leading, 4)
                }
            }
            
            Spacer()
        }
        .padding()
    }