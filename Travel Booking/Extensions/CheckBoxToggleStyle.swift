//
//  CheckBoxToggleStyle.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(lineWidth: 2)
                .frame(width: 20, height: 20)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            
            configuration.label
            
        }
    }
}
