//
//  NewContactView.swift
//  notifyme
//
//  Created by Anne Ferret on 12/11/2025.
//


import SwiftUI
import SwiftData

struct NewContactView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var daysBetweenNotifications: Int = 7
    @State private var nextNotification: Date = Date()
    
    private var isNameValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("newContact.header.contactInformation") {
                    TextField("newContact.inputField.name", text: $name)
                }
                Section("newContact.header.notificationSetting") {
                    Stepper("newContact.stepper.everyXDays \(daysBetweenNotifications)", value: $daysBetweenNotifications, in: 1...60)
                }
            }
            .navigationTitle("newContact.title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("button.cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("button.save") {
                        let trimmedName = name.trimmingCharacters(in: .whitespaces)
                        let newContact = Contact(
                            name: trimmedName,
                            daysBetweenNotifications: daysBetweenNotifications,
                            nextNotification: nextNotification
                        )
                        modelContext.insert(newContact)
                        dismiss()
                    }
                    .disabled(!isNameValid)
                }
            }
        }
    }
}
