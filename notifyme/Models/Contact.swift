//
//  Contact.swift
//  notifyme
//
//  Created by Anne Ferret on 12/11/2025.
//


import Foundation
import SwiftData

@Model
class Contact {
    var name: String
    var daysBetweenNotifications: Int
    var nextNotification: Date?
    var nextNotificationFormatted: String {
        nextNotification?.formatted(date: .abbreviated, time: .omitted) ?? "never"
    }
    
    init(name: String, daysBetweenNotifications: Int, nextNotification: Date?) {
        self.name = name
        self.daysBetweenNotifications = daysBetweenNotifications
        self.nextNotification = nextNotification ?? Date()
    }
}
