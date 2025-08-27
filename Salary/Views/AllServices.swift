//
//  AllServices.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct AllServicesView: View {
  var body: some View {
    NavigationStack{
      VStack{
        TopView(text: "All Services")
        IconsView()
      }
      .frame(maxHeight: .infinity, alignment: .top)
    }
  }
}

struct TopView: View {
  var text: String
  var body: some View {
    ZStack {
      TitlesView(text: text)
        .multilineTextAlignment(.center)
      HStack {
        BackArrowView()
        Spacer()
      }
    }
    .padding()
  }
}

struct IconsView: View {
  private static let columns: [GridItem] = Array(repeating: .init(.flexible(), alignment: .center), count: 3)
  
  let icons: [(systemName: String, text: String, isNavigation: Bool)] = [
    ("plus.circle.fill", "Add Money", false),
    ("arrow.up", "Withdraw", false),
    ("arrow.right.arrow.left", "Send Money", false),
    ("questionmark", "eFawateercom", false),
    ("questionmark", "Umniah", false),
    ("heart.circle.fill", "Insurance", false),
    ("questionmark", "Loan", false),
    ("dollarsign.circle.fill", "Salary", true),
    ("percent", "eVouchers", false),
    ("questionmark", "Donations", false),
    ("qrcode", "Scan QR", false)
  ]
  
  var body: some View {
    LazyVGrid(columns: IconsView.columns, spacing: 30) {
      
      ForEach(icons, id: \.text) { item in
        if item.isNavigation {
          NavigationLink(destination: SalaryView()) {
            createIcon(systemName: item.systemName, text: item.text)
          }
          .buttonStyle(.plain)
        } else {
          createIcon(systemName: item.systemName, text: item.text)
        }
      }
      
    }
    .padding(24)
  }
  
}

#Preview {
  AllServicesView()
}
