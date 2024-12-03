import SwiftUI

struct Settings: View {
    @AppStorage("backgroundColorHex") private var backgroundColorHex: String = Color.teal.toHex
    @AppStorage("fontSize") private var fontSize: Double = 16
    
    private var backgroundColor: Binding<Color> {
        Binding(
            get: { Color.fromHex(backgroundColorHex) },
            set: { backgroundColorHex = $0.toHex }
        )
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Шрифт")) {
                    Slider(value: $fontSize, in: 12...30, step: 1) {
                        Text("Розмір шрифту")
                    }
                    Text("Приклад тексту")
                        .font(.system(size: fontSize))
                }
                
                Section(header: Text("Фон")) {
                    ColorPicker("Оберіть колір фону", selection: backgroundColor)
                }
            }
            .navigationTitle("Налаштування")
        }
    }
}
