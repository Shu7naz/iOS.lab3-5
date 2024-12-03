//
//  Event.swift
//  Lab_3
//
//  Created by IPZ-31 on 03.12.2024.
//

import Foundation

struct Event: Identifiable {
    var id = UUID()  // Унікальний ідентифікатор для кожної події
    var title: String
    var date: Date
    var location: String
    var description: String
}
