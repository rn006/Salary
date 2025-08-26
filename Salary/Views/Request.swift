//
//  Request.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//
import SwiftUI

struct requestView: View {
  @Binding var isHidden: Bool
  @Binding var transactions: [Transaction]
  let data = Data()
  var body: some View {
    
    //Request Details
    VStack{
      
      VStack(spacing: 30) {
        
        HStack {
          Text("Current Eligible")
            .font(.kanit18)
            .fontWeight(.medium)
            .kerning(-0.2)
            .foregroundColor(.accentColor)
          Spacer()
        }
        
        details(text1: "Earned Wage Percentage", text2: "5%")
        
        details(text1: "Maximum Eligible Amount", text2: String(data.maxEligAmount) + " JOD" )
        
        details(text1: "Remaning Eligible Amount", text2: String(data.remainingEligAmount) + " JOD")
        
        details(text1: "Remaining Number of Withdrawals", text2: String(data.remainingWithdrawalNum))
        
        details(text1: "Next Cycle Start Date", text2: "15/08/2025")
        
      }
      Spacer()
      
      //Request Withdrawal Button
      NavigationLink(destination: topWithdrawalView(transactions: $transactions)){
        buttonLabel(text: "Request Withdrawal", color: "AccentColor")
      }
    }
    .padding()
  }
  
  
}

#Preview {
  @Previewable @State var isHidden: Bool = false
  @Previewable @State var transactions: [Transaction] = []
  requestView(isHidden: $isHidden, transactions: $transactions)
}
