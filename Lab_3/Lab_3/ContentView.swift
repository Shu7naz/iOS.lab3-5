import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EventViewModel()
    
    // Зчитуємо налаштування для кольору фону та розміру шрифтів
    @AppStorage("backgroundColorHex") private var backgroundColorHex: String = Color.teal.toHex
    @AppStorage("fontSize") private var fontSize: Double = 16
    
    private var backgroundColor: Color {
        Color.fromHex(backgroundColorHex)
    }
    
    @State private var showingSettings = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events) { event in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.system(size: CGFloat(fontSize)))
                                .fontWeight(.bold)
                            Text(event.date, style: .date)
                                .font(.system(size: CGFloat(fontSize - 2)))
                        }
                        Spacer()
                        Button(action: {
                            viewModel.deleteEvent(event: event)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
//                    .background(backgroundColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .onDelete(perform: deleteEvents)
            }
            .navigationTitle("Події")
            .navigationBarItems(
                leading: Button(action: {
                    showingSettings.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                },
                trailing: NavigationLink("Додати", destination: AddEventView(viewModel: viewModel))
            )
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
        }
        .accentColor(.primary)
        .sheet(isPresented: $showingSettings) {
            Settings()
        }
    }
    
    func deleteEvents(at offsets: IndexSet) {
        for index in offsets {
            let event = viewModel.events[index]
            viewModel.deleteEvent(event: event)
        }
    }
}

#Preview {
    ContentView()
}
