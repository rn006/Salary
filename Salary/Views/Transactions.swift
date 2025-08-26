//
//  Transaction_Details.swift
//  Salary
//
//  Created by Raya on 24/08/2025.
//

import SwiftUI

struct transactionsView: View {
  @Binding var isHidden: Bool
  @State private var transactionShowing: Bool = false
  var transaction: Transaction
  var body: some View {
    
    Button{
      transactionShowing.toggle()
    } label: {
      VStack(alignment: .leading, spacing: 8) {
        HStack{
          footnoteText(text: transaction.date)
            .opacity(0.3)
          Spacer()
        }
        
        HStack{
          greenText(text: String(format: "%.3f", transaction.amount))
          detailsText(text: transaction.currency)
          Spacer()
          greenText(text: "GreenStatus")
        }
        
        HStack{
          kanitLight(text: "Reference Number")
          Spacer()
        }
        
        HStack{
          detailsText(text: transaction.reference)
          Spacer()
        }
        
        HStack{
          kanitLight(text: transaction.time)
            
          Spacer()
        }
      }
      .opacity(isHidden ? 0 : 1)
      .frame(alignment: .topLeading)
      .padding()
    }
    
    .sheet(isPresented: $transactionShowing){
      transactionDetailsView(transactionShowing: $transactionShowing, transaction: transaction)
        .presentationDetents([.height(400)])
        .presentationCornerRadius(30)
    }
  }
}
