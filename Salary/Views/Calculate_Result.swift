//
//  Calculate_Result.swift
//  Salary
//
//  Created by Raya on 24/08/2025.
//
import SwiftUI

struct calculateResultView: View {
  @Binding var isShowing: Bool
  @Binding var transactions: [Transaction]
  
  @State private var option: Option = .addFees
  @State private var isConfirmationShowing: Bool = false
  
  var data = Data()
  
  var totalAmount: Double {
    switch option {
    case .addFees:
      return Data.amountToWithdraw + data.fees + data.tax
      
    case .deductFees:
      return Data.amountToWithdraw - data.fees + data.tax
    }
  }
  
  enum Option {
    case addFees
    case deductFees
  }
  
  var body: some View {
    VStack{
      
      HStack{
        Spacer()
        Button{
          isShowing = false
        } label: {
          Image(systemName:"xmark")
        }
      }
      Spacer()
      
      HStack{
        Text("Calculate Result")
          .font(.kanit16)
        Spacer()
      }
      
      dashedLine()
      
      details(text1: "Fees", text2: String(format: "%.3f", data.fees) + " JOD")
      
      Spacer(minLength: 10)
      
      details(text1: "Tax", text2: String(format: "%.3f", data.tax) + " JOD")
      
      dashedLine()
      
      HStack{
        Text("Total Amount")
          .font(.kanitMed14)
          .opacity(0.3)
        Spacer()
        detailsSB(text: String(format: "%.3f", totalAmount) +  " JOD")
      }.padding()
        .overlay(
          strokeRectView()
        )
      
      Spacer()
        .frame(height: 10)
      
      optionButton(option: calculateResultView.Option.addFees, selectedOption: $option, text: "Add the fees on the total amount.")
      
      
      Spacer()
        .frame(height: 10)
      
      optionButton(option: calculateResultView.Option.deductFees, selectedOption: $option, text: "Deduct it from the entered amount.")
      
      Spacer()
      
      Button{
        isConfirmationShowing.toggle()
        transactions.insert(
          Transaction(date:getDate(), amount: totalAmount, currency: "JOD", status: "Success", reference: "MT-3426FA145262A32651", time: getTime()), at: 0
        )
      } label: {
        buttonLabel(text: "Request", color: "AccentColor")
      }
      
      .sheet(isPresented: $isConfirmationShowing){
        confirmationView()
          .presentationDetents([.height(200)])
          .presentationCornerRadius(30)
      }
      
    } .padding()
  }
}
