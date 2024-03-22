//
//  AnyTransition+.swift
//
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

extension AnyTransition {
    static var reverSlide: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
}
