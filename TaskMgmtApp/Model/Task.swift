//
//  Task.swift
//  TaskMgmtApp
//
//  Created by Oko-osi Korede on 31/07/2023.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tintColor: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record Video", creationDate: .init(), isCompleted: true, tintColor: .white),
    .init(taskTitle: "Redesign Website", creationDate: .init(), isCompleted: true, tintColor: .blue),
    .init(taskTitle: "Go for a walk", creationDate: .init(), isCompleted: false, tintColor: .yellow),
    .init(taskTitle: "Edit Video", creationDate: .init(), isCompleted: true, tintColor: .green),
    .init(taskTitle: "Publish Video", creationDate: .init(), isCompleted: false, tintColor: .purple)
]

extension Date {
    static func updateHour(_ value: Int) -> Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
