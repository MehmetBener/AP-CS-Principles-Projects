// Mehmet Bener - AP CS P - Clock App V3 - Spiderman Watch

import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minute = 0
    
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
                    .foregroundColor(.blue)
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
                
                Group {
                    Image("kingpin").resizable().scaledToFit().frame(width: 60, height: 60)
                        .offset(x: 0, y: -r - 30)
                    
                    Image("green_goblin").resizable().scaledToFit().frame(width: 80, height: 80)
                        .offset(x: r + 25, y: 0)
                    
                    Image("venom").resizable().scaledToFit().frame(width: 80, height: 80)
                        .offset(x: 0, y: r + 28)
                    
                    Image("doctor_octopus").resizable().scaledToFit().frame(width: 80, height: 80)
                        .offset(x: -r - 25, y: 0)
                }
                
                Image("spiderman")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .offset(x: 25, y: 45)
                    .opacity(0.95)
                
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
            
            HStack(spacing: 12) {
                Button("- Hour") { hour = (hour == 0) ? 23 : (hour - 1) }
                    .buttonStyle(.bordered)
                Button("+ Hour") { hour = (hour == 23) ? 0 : (hour + 1) }
                    .buttonStyle(.bordered)
            }
            
            HStack(spacing: 12) {
                Button("- Minute") {
                    if minute == 0 {
                        minute = 59
                        hour = (hour == 0) ? 23 : (hour - 1)
                    } else {
                        minute -= 1
                    }
                }
                .buttonStyle(.bordered)
                
                Button("+ Minute") {
                    if minute == 59 {
                        minute = 0
                        hour = (hour == 23) ? 0 : (hour + 1)
                    } else {
                        minute += 1
                    }
                }
                .buttonStyle(.bordered)
            }
            
            Text("Tap buttons to set time")
                .font(.footnote).foregroundStyle(.secondary)
        }
        .padding()
    }
}
