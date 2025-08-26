//
//  Transaction_Details.swift
//  Salary
//
//  Created by Raya on 25/08/2025.
//

import SwiftUI

struct transactionDetailsView: View {
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
        footnoteText(text: transaction.status)
      }
      .padding(6)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color("GrayLight"))
      )
      
      Text(String(format: "%.3f", transaction.amount) + " JOD")
        .font(.title)
        .bold()
      
      HStack{
        Text("Transaction Details")
          .font(.kanit16)
          .foregroundColor(.accent)
        Spacer()
      }

      details(text1: "Transaction ID", text2: transaction.reference)

      dashedLine()

      details(text1: "Date/Time", text2: "\(transaction.date), \(transaction.time)")
    
      details(text1: "Withdrawal Amount", text2: String(Data.amountToWithdraw) + " JOD")

      details(text1: "Fees Deducted", text2: String(data.fees) + " JOD")

      details(text1: "Tax", text2: String(data.tax) + " JOD")

      details(text1: "Net Amount", text2: String(data.fees + data.tax + Data.amountToWithdraw))

      details(text1: "Remaining Eligibility", text2: String(data.remainingEligAmount))
      
    }
    .padding()
  }
}

