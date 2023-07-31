//
//  View + Extension.swift
//  TaskMgmtApp
//
//  Created by Oko-osi Korede on 31/07/2023.
//

import SwiftUI

/// Custom View Extension
extension View {
    /// Custom Spacer
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    /// Checking Two dates are same
    @ViewBuilder
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
