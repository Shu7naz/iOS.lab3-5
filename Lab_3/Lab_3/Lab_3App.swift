import SwiftUI

@main
struct Lab_3App: App {
    // Зчитуємо налаштування перед запуском додатку
    @AppStorage("backgroundColorHex") private var backgroundColorHex: String = Color.teal.toHex
    @AppStorage("fontSize") private var fontSize: Double = 16
    
    private var backgroundColor: Color {
        Color.fromHex(backgroundColorHex)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // Налаштування фонового кольору та розміру шрифту
                    UINavigationBar.appearance().backgroundColor = UIColor(backgroundColor)
                    UINavigationBar.appearance().largeTitleTextAttributes = [
                        .font: UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .bold)
                    ]
                }
        }
    }
}
