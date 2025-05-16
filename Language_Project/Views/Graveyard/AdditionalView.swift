//
//  AdditionalView.swift
//  Language_Project
//
//  Created by Jan Grnac on 27/01/2025.
//

import SwiftUI

struct AdditionalView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .background(
                RadialGradient(gradient: Gradient(colors: [Color.blue, Color.red]), center: .center,startRadius: 5, endRadius: 300)
            )
            .frame(height:1000)
            .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    AdditionalView()
}
