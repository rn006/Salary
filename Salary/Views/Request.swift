//
//  Request.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//
import SwiftUI

struct RequestView: View {
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
        
        showDetails(text1: "Earned Wage Percentage", text2: "5%")
        
        showDetails(text1: "Maximum Eligible Amount", text2: String(data.maxEligAmount) + " JOD" )
        
        showDetails(text1: "Remaning Eligible Amount", text2: String(data.remainingEligAmount) + " JOD")
        
        showDetails(text1: "Remaining Number of Withdrawals", text2: String(data.remainingWithdrawalNum))
        
        showDetails(text1: "Next Cycle Start Date", text2: "15/08/2025")
        
      }
      Spacer()
      
      //Request Withdrawal Button
      NavigationLink(destination: TopWithdrawalView(transactions: $transactions)){
        ButtonLabelView(text: "Request Withdrawal", color: "AccentColor")
      }
    }
    .padding()
  }
  
  
}

#Preview {
  @Previewable @State var isHidden: Bool = false
  @Previewable @State var transactions: [Transaction] = []
  RequestView(isHidden: $isHidden, transactions: $transactions)
}
