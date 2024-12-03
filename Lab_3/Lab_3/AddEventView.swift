import SwiftUI

struct AddEventView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: EventViewModel
    
    @State private var title = ""
    @State private var date = Date()
    @State private var location = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Назва події")) {
                    TextField("Введіть назву", text: $title)
                }
                
                Section(header: Text("Дата події")) {
                    DatePicker("Оберіть дату", selection: $date, displayedComponents: .date)
                }
                
                Section(header: Text("Місце проведення")) {
                    TextField("Введіть місце", text: $location)
                }
                
                Section(header: Text("Опис")) {
                    TextField("Введіть опис", text: $description)
                }
            }
            .navigationTitle("Нова подія")
            .navigationBarItems(leading: Button("Скасувати") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Зберегти") {
                viewModel.addEvent(title: title, date: date, location: location, description: description)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
