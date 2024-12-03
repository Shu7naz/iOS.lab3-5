import Foundation

struct Event: Identifiable {
    var id = UUID()  // Унікальний ідентифікатор для кожної події
    var title: String
    var date: Date
    var location: String
    var description: String
}
