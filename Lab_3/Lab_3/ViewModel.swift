import Foundation

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    // Додавання нової події
    func addEvent(title: String, date: Date, location: String, description: String) {
        let newEvent = Event(title: title, date: date, location: location, description: description)
        events.append(newEvent)
    }
    
    // Редагування існуючої події
    func editEvent(event: Event, newTitle: String, newDate: Date, newLocation: String, newDescription: String) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].title = newTitle
            events[index].date = newDate
            events[index].location = newLocation
            events[index].description = newDescription
        }
    }
    
    // Видалення події
    func deleteEvent(event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    // Фільтрація подій за датою
    func filterEvents(byDate date: Date) -> [Event] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: startOfDay)!
        
        return events.filter { $0.date >= startOfDay && $0.date <= endOfDay }
    }
    
    // Фільтрація подій за місцем
    func filterEvents(byLocation location: String) -> [Event] {
        return events.filter { $0.location.contains(location) }
    }
}
