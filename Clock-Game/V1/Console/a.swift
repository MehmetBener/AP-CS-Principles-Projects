
import Foundation

func initialTimeForLevel(level: Int) -> Int {
    if level == 1 {
        return 20
    } else if level == 2 {
        return 18
    } else if level == 3 {
        return 16
    } else if level == 4 {
        return 14
    } else {
        return 8
    }
}

for level in 1...5 {
    let start = initialTimeForLevel(level: level)
    print("— Level \(level) — (start time: \(start)s)")
    
    for t in stride(from: start, through: 0, by: -1) {
        if t > 0 {
            print("Time remaining: \(t)s")
        } else {
            print("TIME UP! Restarting clock…")
        }
    }
}
