// Mehmet Bener - AP CS P - Clock App V5 (Version 1 - Number Clock)

import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minute = 0
    @State private var numberColors: [Color] = Array(repeating: .white, count: 12)
    
    var minuteAngle: Angle { .degrees(Double(minute) * 6) }
    var hourAngle: Angle {
        let base = Double(hour % 12) * 30.0
        let extra = Double(minute) / 2.0
        return .degrees(base + extra)
    }
    var ampm: String { hour < 12 ? "AM" : "PM" }
    var displayHour: Int { let h = hour % 12; return h == 0 ? 12 : h }
    
    private let r: CGFloat = 120
    
    var body: some View {
        VStack(spacing: 14) {
            Text(String(format: "%02d:%02d %@", displayHour, minute, ampm))
                .font(.title2).bold().foregroundColor(.black)
            
            ZStack {
                Circle()
                    .frame(width: 340, height: 340)
                    .foregroundColor(.yellow)
                    .opacity(0.3)
                    .shadow(color: .black.opacity(0.25), radius: 10, y: 6)
                
                ZStack {
                    ForEach(0..<12) { i in
                        Capsule()
                            .fill(Color.black.opacity(0.7))
                            .frame(width: 4, height: 18)
                            .offset(y: -140)
                            .rotationEffect(.degrees(Double(i) * 30))
                    }
                    ForEach(0..<60) { i in
                        if i % 5 != 0 {
                            Capsule()
                                .fill(Color.black.opacity(0.6))
                                .frame(width: 2, height: 10)
                                .offset(y: -140)
                                .rotationEffect(.degrees(Double(i) * 6))
                        }
                    }
                }
                .padding(24)
                
                ForEach(0..<12) { i in
                    let angle = Double(i) * 30.0
                    if i == 0 {
                        Text("12")
                            .font(.system(size: (12) == displayHour ? 54 : 18, weight: (12) == displayHour ? .bold : .semibold))
                            .foregroundColor(numberColors[i])
                            .rotationEffect(.degrees(-angle))
                            .offset(y: -r)
                            .rotationEffect(.degrees(angle))
                    } else {
                        Text("\(i)")
                            .font(.system(size: (i) == displayHour ? 54 : 18, weight: (i) == displayHour ? .bold : .semibold))
                            .foregroundColor(numberColors[i])
                            .rotationEffect(.degrees(-angle))
                            .offset(y: -r)
                            .rotationEffect(.degrees(angle))
                    }
                }
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 8, height: 140)
                    .offset(y: -70)
                    .rotationEffect(minuteAngle)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 12, height: 100)
                    .offset(y: -50)
                    .rotationEffect(hourAngle)
                
                Circle().fill(Color.black)
                    .frame(width: 12, height: 12)
            }
            .frame(width: 340, height: 340)
            .animation(.smooth(duration: 0.4), value: hourAngle)
            .animation(.smooth(duration: 0.4), value: minuteAngle)
            .contentShape(Rectangle())
            .onTapGesture {
                hour = (hour == 23) ? 0 : (hour + 1)
                numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
            }
            
            HStack(spacing: 12) {
                Button("- Hour") {
                    hour = (hour == 0) ? 23 : (hour - 1)
                    numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
                }
                .buttonStyle(.bordered)
                Button("+ Hour") {
                    hour = (hour == 23) ? 0 : (hour + 1)
                    numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
                }
                .buttonStyle(.bordered)
            }
            
            HStack(spacing: 12) {
                Button("- Minute") {
                    if minute == 0 {
                        minute = 59
                        hour = (hour == 0) ? 23 : (hour - 1)
                        numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
                    } else {
                        minute -= 1
                    }
                }
                .buttonStyle(.bordered)
                
                Button("+ Minute") {
                    if minute == 59 {
                        minute = 0
                        hour = (hour == 23) ? 0 : (hour + 1)
                        numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
                    } else {
                        minute += 1
                    }
                }
                .buttonStyle(.bordered)
            }
            
            Button("Random Hour") {
                hour = Int.random(in: 0...23)
                numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 4)
        }
        .padding()
        .onAppear {
            numberColors = (0..<12).map { _ in Color(hue: Double.random(in: 0...1), saturation: 0.85, brightness: 0.95) }
        }
    }
}
