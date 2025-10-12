import SwiftUI
import Combine

struct ContentView: View {
    struct Obstacle: Identifiable { let id = UUID(); var x: CGFloat; var y: CGFloat; var w: CGFloat; var h: CGFloat; var v: CGFloat }
    
    @State private var lvl = 1
    @State private var t = 20
    @State private var run = false
    @State private var px: CGFloat = -120
    @State private var obs: [Obstacle] = []
    @State private var tick = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    @State private var acc: Double = 0
    
    let d: CGFloat = 280
    var r: CGFloat { d/2 }
    let ps: CGFloat = 34
    
    func initTime(_ L: Int) -> Int {
        if L == 1 { return 20 }
        else if L == 2 { return 18 }
        else if L == 3 { return 16 }
        else if L == 4 { return 14 }
        else { return 8 }
    }
    
    func start(_ L: Int) {
        let L2 = max(1, L)
        lvl = L2
        t = initTime(L2)
        run = true
        px = -r + 40
        spawn(L2)
    }
    
    func reset() { run = false; start(lvl) }
    func next() { run = false; lvl += 1; start(lvl) }
    
    func spawn(_ L: Int) {
        obs.removeAll()
        let c = min(6, 3 + L)
        let b: CGFloat = 50
        let s: CGFloat = CGFloat(L) * 12
        for i in 0..<c {
            let x = CGFloat.random(in: -r + 20 ... r - 60)
            let w = CGFloat.random(in: 24...50)
            let h = CGFloat.random(in: 12...26)
            let v = b + s + CGFloat(i) * 4
            obs.append(.init(x: x, y: -r - CGFloat.random(in: 20...180), w: w, h: h, v: v))
        }
    }
    
    func pFrame(_ size: CGSize) -> CGRect {
        let cx = size.width/2, cy = size.height/2
        return CGRect(x: cx + px - ps/2, y: cy - ps/2, width: ps, height: ps)
    }
    
    func oFrame(_ o: Obstacle, _ size: CGSize) -> CGRect {
        let cx = size.width/2, cy = size.height/2
        return CGRect(x: cx + o.x, y: cy + o.y, width: o.w, height: o.h)
    }
    
    func reached(_ size: CGSize) -> Bool {
        let f = pFrame(size)
        let cx = size.width/2
        return f.maxX >= cx + r - 20
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Clock Game")
                Spacer()
                Text("Level \(lvl)")
            }
            .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                Capsule().frame(height: 10).opacity(0.15)
                GeometryReader { g in
                    let tot = CGFloat(initTime(lvl))
                    let cur = CGFloat(max(0, t))
                    Capsule()
                        .frame(width: tot == 0 ? 0 : g.size.width * (cur / tot), height: 10)
                        .animation(.linear(duration: 0.2), value: t)
                }
            }
            .frame(height: 10)
            .padding(.horizontal)
            
            Text("\(t)s").font(.system(size: 42, weight: .bold)).monospacedDigit()
            
            GeometryReader { geo in
                ZStack {
                    Circle().strokeBorder(.gray.opacity(0.4), lineWidth: 6).frame(width: d, height: d)
                    Circle().fill(.green.opacity(0.25)).frame(width: 50, height: 50).offset(x: r - 25)
                    Text("🐸")
                        .font(.system(size: ps))
                        .frame(width: ps, height: ps)
                        .position(x: geo.size.width/2 + px, y: geo.size.height/2)
                    ForEach(obs) { o in
                        Rectangle()
                            .fill(.red.opacity(0.85))
                            .frame(width: o.w, height: o.h)
                            .position(x: geo.size.width/2 + o.x, y: geo.size.height/2 + o.y)
                    }
                }
                .onReceive(tick) { _ in
                    guard run else { return }
                    let dt: CGFloat = 0.02
                    var n: [Obstacle] = []
                    for var o in obs {
                        o.y += o.v * dt * 0.5
                        if o.y > r + 40 {
                            o.y = -r - CGFloat.random(in: 40...180)
                            o.x = CGFloat.random(in: -r + 20 ... r - 60)
                        }
                        n.append(o)
                    }
                    obs = n
                    acc += 0.02
                    if acc >= 1 {
                        acc -= 1
                        if t > 0 { t -= 1 }
                        if t == 0 { run = false; DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { reset() } }
                    }
                    let pf = pFrame(geo.size)
                    for o in obs {
                        if pf.intersects(oFrame(o, geo.size)) {
                            run = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { reset() }
                            return
                        }
                    }
                    if reached(geo.size) && t > 0 { next() }
                }
            }
            .frame(height: 360)
            
            HStack(spacing: 16) {
                Button("Left") { px -= 20 }.buttonStyle(.bordered)
                Button(run ? "Pause" : "Start") {
                    if run { run = false } else { if t <= 0 { start(lvl) } else { run = true } }
                }
                .buttonStyle(.borderedProminent)
                Button("Right") { px += 20 }.buttonStyle(.bordered)
            }
            .padding(.bottom)
        }
        .padding(.top)
        .onAppear { start(1) }
    }
}
