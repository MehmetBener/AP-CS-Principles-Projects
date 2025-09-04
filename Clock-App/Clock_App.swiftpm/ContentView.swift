// Mehmet Bener - AP CS P - Clock App
import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minuteSeg = 0
    
    var minuteAngle: Angle {
        Angle.degrees(Double(minuteSeg) * 90)
    }
    var hourAngle: Angle {
        let base = Double(hour % 12) * 30.0
        let quarter = Double(minuteSeg) * 7.5
        return Angle.degrees(base + quarter)
    }
    var ampm: String {
        hour < 12 ? "AM" : "PM"
    }
    var displayHour: Int {
        let h = hour % 12
        return h == 0 ? 12 : h
    }
    
    var body: some View {
        ZStack {
            if hour < 12 {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(.yellow)
            } else {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(.blue)
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
            
            if hour % 2 == 0 {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
            } else {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)
            }
            
            Text(String(format: "%02d:%02d %@", displayHour, minuteSeg * 15, ampm))
                .offset(y: 220)
                .font(.title)
                .bold()
                .foregroundColor(.black)
        }
        .frame(width: 420, height: 460)
        .contentShape(Rectangle())
        .onTapGesture {
            minuteSeg += 1
            if minuteSeg == 4 {
                minuteSeg = 0
                hour = (hour + 1) % 24
            }
        }
    }
}
