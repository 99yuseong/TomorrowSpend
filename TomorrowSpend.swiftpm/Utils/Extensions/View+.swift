//
//  View+.swift
//
//
//  Created by 남유성 on 3/24/24.
//

import SwiftUI

extension View {
    func scaleToInfinity() -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
