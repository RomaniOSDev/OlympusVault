//
//  SettingButtonView.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 16.07.2025.
//

import SwiftUI

struct SettingButtonView: View {
    var text = ""
    var imageName = ""
    var body: some View {
        ZStack {
            Color(.perpeleApp)
                .cornerRadius(30)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.perpleApp, lineWidth: 2.0)
                }
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)

                Text(text)
                Spacer()
            }
            .padding(.horizontal, 35)
            .foregroundStyle(.perpleApp)
                .font(.system(size: 22))
        }
        .frame(width: 336, height: 58)
    }
}

#Preview {
    SettingButtonView()
}
