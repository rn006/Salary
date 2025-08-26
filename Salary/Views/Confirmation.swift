//
//  Confirmation.swift
//  Salary
//
//  Created by Raya on 24/08/2025.
//

import SwiftUI

struct confirmationView: View {
  @State private var done = false
  @Environment(\.dismiss) private var dismiss
  var data = Data()
  var body: some View {
    
    VStack{
      Image(systemName: "checkmark.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 45, height: 45)
        .foregroundColor(Color("GreenStatus"))
      
      detailsText(text: "Your request has been completed successfully")
        .opacity(0.5)
        .multilineTextAlignment(.center)
      
      Button{
        dismiss()
      } label: {
        buttonLabel(text: "Send Via Email", color: "AccentColor")
      }
      
    }
    .padding(24)
    
  }
}

