//
//  DebugView.swift
//  notifyme
//
//  Created by Anne Ferret on 12/11/2025.
//


import SwiftUI

struct DebugView: View {
    @State private var pendingNotifications: [UNNotificationRequest] = []

    var body: some View {
        List {
            if pendingNotifications.isEmpty {
                Text("No scheduled notifications")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(pendingNotifications, id: \.identifier) { notification in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(notification.content.title)
                            .font(.headline)
                        Text(notification.content.body)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        if let trigger = notification.trigger as? UNTimeIntervalNotificationTrigger {
                            let fireDate = Date(timeIntervalSinceNow: trigger.timeInterval)
                            Text(fireDate.formatted(date: .long, time: .shortened))
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                        
                        Text("ID: \(notification.identifier)")
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .onAppear {
            loadNotifications()
        }
        .refreshable {
            loadNotifications()
        }
    }
    
    private func loadNotifications() {
        NotificationManager.shared.getPendingNotifications { notifications in
            pendingNotifications = notifications.sorted {
                guard let trigger1 = $0.trigger as? UNTimeIntervalNotificationTrigger,
                      let trigger2 = $1.trigger as? UNTimeIntervalNotificationTrigger else {
                    return false
                }
                return trigger1.timeInterval < trigger2.timeInterval
            }
        }
    }
}
