// Mehmet Bener - AP CS P - Clock App
import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minute = 0
    
    var minuteAngle: Angle { .degrees(Double(minute) * 6) } 
    var hourAngle: Angle {
        let base = Double(hour % 12) * 30.0
        let quarter = Double(minute / 2)
        return .degrees(base + quarter)
    }
    var ampm: String { hour < 12 ? "AM" : "PM" }
    var displayHour: Int { let h = hour % 12; return h == 0 ? 12 : h }
    
    var body: some View {
        ZStack {
            ZStack {
                (hour < 12 ? Color.yellow : Color.blue)
                    .clipShape(Circle())
                    .frame(width: 400, height: 400)
                    }
                Rectangle()
                    .frame(width: 6, height: 160)
                    .foregroundColor(.white)
                    .offset(y: -80)
                    .rotationEffect(minuteAngle)
                Rectangle()
                    .frame(width: 10, height: 110)
                    .foregroundColor(.white)
                    .offset(y: -55)
                    .rotationEffect(hourAngle)
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)
            }
            
            VStack(spacing: 10) {
                Text(String(format: "%02d:%02d %@", displayHour, minute, ampm))
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Button("- Hour") {
                        if hour == 0 {
                            hour = 23
                        } else {
                            hour -= 1
                        }
                    }
                    .buttonStyle(.bordered)
                    
                    Button("+ Hour") {
                        if hour == 24 {
                            hour = 0
                        } else {
                            hour += 1
                        }
                    }
                    .buttonStyle(.bordered)
                }
                HStack(spacing: 12) {
                    Button("- Minute") {
                        if minute == 0 {
                            if hour == 0 {
                                hour = 23
                            } else {
                                hour -= 1
                            }
                            minute = 59
                        } else {
                            minute -= 1 
                        }
                    }
                    .buttonStyle(.bordered)
                    Button("+ Minute") {
                        if minute == 59 {
                            minute = 0
                            hour += 1
                        } else {
                            minute += 1   
                        }
                    }
                    .buttonStyle(.bordered)
                }
            }
            .animation(.smooth(duration: 0.5), value: hourAngle)
            .animation(.smooth(duration: 0.5), value: minuteAngle)
    }
}
