import Foundation

// TODO: Convert a decimal (0–15) into a 4-bit binary string
func decimalToBinary(_ number: Int) -> String {
    if number == 0 { return "0" }
    
    var num = number
    var binary = ""
    
    while num > 0 {
        let remainder = num % 2
        binary = String(remainder) + binary
        num = num / 2
    }
    
    return binary
}

// Simulate enrollments
var id = 0
for _ in 1...20 {
    print("Decimal: \(id), Binary: \(decimalToBinary(id))")
    id += 1
    if id > 15 {
        id = 0   // overflow reset
    }
}
