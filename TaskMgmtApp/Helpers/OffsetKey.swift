//
//  OffsetKey.swift
//  TaskMgmtApp
//
//  Created by Prof_K on 31/07/2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
