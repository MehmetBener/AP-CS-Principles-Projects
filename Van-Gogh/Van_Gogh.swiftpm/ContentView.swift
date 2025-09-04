// Mehmet Bener - AP CS P - Man
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Face
            Rectangle()
                .frame(width: 400, height: 560)
                .cornerRadius(180)
                .offset(y: -120)
                .foregroundColor(.yellow)
                .opacity(0.4)
            // Neck
            Rectangle()
                .frame(width: 100, height: 360)
                .cornerRadius(0)
                .offset(y: 335)
                .foregroundColor(.yellow)
                .opacity(0.4)
            // Left eye
            Image(systemName: "eye.fill")  
                .imageScale(.large)
                .offset(x: -80, y: -200)
                .font(.system(size: 55))
                .foregroundColor(.black)
                .shadow(radius: 7)
            // Right eye
            Image(systemName: "eye.fill")
                .imageScale(.large)
                .offset(x: 80, y: -200)
                .font(.system(size: 55))
                .shadow(radius: 7)
            // Nose
            Image(systemName: "nose")
                .imageScale(.large)
                .offset(y: -120)
                .font(.system(size: 70))
                .shadow(radius: 7)
            // Mouth
            Image(systemName: "mouth.fill")
                .imageScale(.large)
                .font(.system(size: 70))
                .foregroundColor(.red)
                .opacity(0.6)
                .shadow(radius: 7)
            // Body
            Capsule()
                .offset(y: 740)
                .foregroundColor(.blue)
            // Hat
            Circle()
                .trim(from: 0.5, to: 1.0)
                .frame(width: 400)
                .offset(y: -240)
                .foregroundColor(.gray)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            // Right ear
            Image(systemName: "ear.fill")
                .imageScale(.large)
                .font(.system(size: 100))
                .offset(x: 220, y: -150)
                .foregroundColor(.yellow)
                .opacity(0.4)
        }
    }
}
