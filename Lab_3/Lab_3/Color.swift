import SwiftUI

extension Color {
    // Перетворення кольору в шістнадцятковий код
    var toHex: String {
        let components = self.cgColor?.components ?? [0, 0, 0, 0]
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]
        
        let hexString = String(format: "#%02lX%02lX%02lX", Int(red * 255), Int(green * 255), Int(blue * 255))
        return hexString
    }
    
    // Перетворення шістнадцяткового коду в `Color`
    static func fromHex(_ hex: String) -> Color {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        return Color(red: red, green: green, blue: blue)
    }
}
