//
//  Transaction_Details.swift
//  Salary
//
//  Created by Raya on 24/08/2025.
//

import SwiftUI

struct TransactionsView: View {
  @Binding var isHidden: Bool
  @State private var transactionShowing: Bool = false
  var transaction: Transaction
  var body: some View {
    if !isHidden {
      Button{
        transactionShowing.toggle()
      } label: {
        VStack(alignment: .leading, spacing: 8) {
          HStack{
            FootnoteTextView(text: transaction.date)
              .opacity(0.3)
            Spacer()
          }
          
          HStack{
            GreenTextView(text: transaction.amount.asCurrency())
            DetailsTextView(text: transaction.currency)
            Spacer()
            GreenTextView(text: "Success")
          }
          
          KanitLightView(text: "Reference Number")
          
          DetailsTextView(text: transaction.reference)
          
          KanitLightView(text: transaction.time)
          
        }
        .frame(alignment: .topLeading)
        .padding()
      }
      
      .sheet(isPresented: $transactionShowing){
        TransactionDetailsView(transactionShowing: $transactionShowing, transaction: transaction)
          .presentationDetents([.medium])
          .presentationCornerRadius(30)
      }
    }
  }
}
