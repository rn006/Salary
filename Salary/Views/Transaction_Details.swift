//
//  Transaction_Details.swift
//  Salary
//
//  Created by Raya on 25/08/2025.
//

import SwiftUI

struct TransactionDetailsView: View {
  @Binding var transactionShowing: Bool
  var transaction: Transaction
  let data = Data()
  var body: some View {
    
    VStack(spacing: 10) {
      
      HStack{
        Spacer()
        Button{
          transactionShowing = false
        } label: {
          Image(systemName:"xmark")
        }
      }
      
      
      HStack{
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(Color("GreenStatus"))
        FootnoteTextView(text: transaction.status)
      }
      .padding(6)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color("GrayLight"))
      )
      
      Text(transaction.amount.asCurrency() + " JOD")
        .font(.title)
        .bold()
      
      HStack{
        Text("Transaction Details")
          .font(.kanit16)
          .foregroundColor(.accent)
        Spacer()
      }
      
      showDetails(text1: "Transaction ID", text2: transaction.reference)
      
      DashedLineView()
      
      let details: [(label: String, value: String)] = [
        ("Date/Time", "\(transaction.date), \(transaction.time)"),
        ("Withdrawal Amount", "\(Data.amountToWithdraw) JOD"),
        ("Fees Deducted", "\(data.fees) JOD"),
        ("Tax", "\(data.tax) JOD"),
        ("Net Amount", "\(data.fees + data.tax + Data.amountToWithdraw)"),
        ("Remaining Eligibility", "\(data.remainingEligAmount)")
      ]
      
      ForEach(details, id: \.label) { detail in
        showDetails(text1: detail.label, text2: detail.value)
      }
      
    }
    .padding()
  }
}

