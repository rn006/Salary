//
//  Calculate_Result.swift
//  Salary
//
//  Created by Raya on 24/08/2025.
//
import SwiftUI

struct CalculateResultView: View {
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
      
      DashedLineView()
      
      showDetails(text1: "Fees", text2: data.fees.asCurrency() + " JOD")
      
      Spacer(minLength: 10)
      
      showDetails(text1: "Tax", text2: data.tax.asCurrency() + " JOD")
      
      DashedLineView()
      
      HStack{
        Text("Total Amount")
          .font(.kanitMed14)
          .opacity(0.3)
        Spacer()
        DetailsSBView(text: totalAmount.asCurrency() +  " JOD")
      }.padding()
        .overlay(
          StrokeRectView()
        )
      
      Spacer()
        .frame(height: 10)
      
      OptionButtonView(option: CalculateResultView.Option.addFees, selectedOption: $option, text: "Add the fees on the total amount.")
      
      
      Spacer()
        .frame(height: 10)
      
      OptionButtonView(option: CalculateResultView.Option.deductFees, selectedOption: $option, text: "Deduct it from the entered amount.")
      
      Spacer()
      
      Button{
        isConfirmationShowing.toggle()
        transactions.insert(
          Transaction(date:getDate(), amount: totalAmount, currency: "JOD", status: "Success", reference: "MT-3426FA145262A32651", time: getTime()), at: 0
        )
      } label: {
        ButtonLabelView(text: "Request", color: "AccentColor")
      }
      
      .sheet(isPresented: $isConfirmationShowing){
        ConfirmationView()
          .presentationDetents([.height(200)])
          .presentationCornerRadius(30)
      }
      
    } .padding()
  }
}
