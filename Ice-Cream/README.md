# Ice Cream Overflow (SwiftUI + Console)

This project demonstrates how computers represent data with limited bits and what happens when values exceed that capacity (overflow).

## What’s included
- `ContentView.swift` — SwiftUI app with a cone (triangle) and up to 5 scoops. On the 6th add, it overflows and resets.
- Console simulation (0–15 with 4-bit binary, overflow after 15).
- Screenshots: console output + app UI.

## Reflection

### 1) What is overflow in your app?
Overflow happens when I try to add a 6th scoop even though the cone’s capacity is 5. The app simulates a limited storage register: when I exceed the maximum, it resets to empty (data is “lost”), just like a 4-bit counter wraps from 15 back to 0.

### 2) How does the cone show abstraction?
The cone is an **abstraction** of memory/storage. Each scoop represents one stored unit (like a bit/slot). I don’t show the low-level details of where/how it’s stored—only the essential behavior (add, hold up to capacity, then reset).

### 3) What did you learn about binary & compression?
- **Binary**: A 4-bit number can represent only 0–15. Pushing beyond that overflows/rolls over.
- **Compression**: Limited space forces trade-offs—if we compress data or reduce representation bits, we can store less precise or fewer items. Capacity limits shape how we design systems and UIs (e.g., deciding to reset or block input).

