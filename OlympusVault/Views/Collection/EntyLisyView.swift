//
//  EntyLisyView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 15.07.2025.
//

import SwiftUI

struct EntyLisyView: View {
    let text: String
    var body: some View {
        VStack {
            Image(.lists)
                .resizable()
                .frame(width: 64, height: 64)
            Text(text)
                .foregroundStyle(.gray)
                .font(.system(size: 24))
        }
    }
}

#Preview {
    EntyLisyView(text: "Your collection is empty")
}
