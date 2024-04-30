//
//  ButtonStyle.swift
//  CustomAlertView
//
//  Created by MacBook on 30/04/2024.
//

import SwiftUI

struct OvalButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let textColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
