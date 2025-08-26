//
//  AllServices.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct allServicesView: View {
  var body: some View {
    NavigationStack{
      VStack{
        topView(text: "All Services")
          .frame(alignment: .top)
        iconsView()
      }
      .frame(maxHeight: .infinity, alignment: .top)
    }
  }
}

struct topView: View {
  var text: String
  var body: some View {
    ZStack {
      titles(text: text)
        .multilineTextAlignment(.center)
      HStack {
        backArrow()
        Spacer()
      }
    }
    .padding()
  }
}

struct iconsView: View {
  let columns = [
    GridItem(.flexible(), alignment: .center),
    GridItem(.flexible(), alignment: .center),
    GridItem(.flexible(), alignment: .center)
  ]
  var body: some View {
    LazyVGrid(columns: columns, spacing: 30) {
      
      icon(systemName: "plus.circle.fill", text: "Add Money")
      
      icon(systemName: "arrow.up", text: "Withdraw")
      
      icon(systemName: "arrow.right.arrow.left", text: "Send Money")
      
      icon(systemName: "questionmark", text: "eFawateercom")
      
      icon(systemName: "questionmark",text: "Umniah")
      
      icon(systemName: "heart.circle.fill",text: "Insurance")
      
      icon(systemName: "questionmark", text: "Loan")
      
      NavigationLink(destination: salaryView()){
        icon(systemName: "dollarsign.circle.fill", text:" Salary")
      }
      .buttonStyle(.plain)
      
      icon(systemName: "percent", text: "eVouchers")
      
      icon(systemName: "questionmark", text: "Donations")
      
      icon(systemName: "qrcode", text: "Scan QR")
      
    }
    .padding(24)
  }
  
  private func icon(systemName: String, text: String) -> some View {
    VStack {
      circleView(systemName: systemName, width: 60, height: 60)
      iconText(text: text)
    }
  }
}

#Preview {
  allServicesView()
}
