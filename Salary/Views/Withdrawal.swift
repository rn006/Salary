//
//  Withdrawal.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//

import SwiftUI

struct TopWithdrawalView: View {
  @Binding var transactions: [Transaction]
  var body: some View {
    
    NavigationStack{
      WithdrawalView(transactions: $transactions)
      
      //Back Button
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            BackArrowView()
          }
          ToolbarItem(placement: .principal){
            TitlesView(text: "Salary")
          }
        }
    }
  }
}

struct WithdrawalView: View {
  @State private var selectedAmount: Double? = nil
  @State private var isDisabled: Bool = true
  @State private var isShowing: Bool = false
  @Binding var transactions: [Transaction]
  var data = Data()
  var body: some View {
    VStack {
      
      HStack {
        
        CircleView(systemName: "bag.fill", width: 40, height: 40)
        
        VStack{
          
          HStack{
            DetailsTextView(text: "Remaining Eligible Amount").opacity(0.3)
            Spacer()
          }
          
          HStack {
            IconTextView(text: String(data.remainingEligAmount) + " JOD")
            Spacer()
          }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
      }
      .overlay(
        StrokeRectView()
          .frame(width: 382, height: 76)
      )
      
      HStack{
        buttons(amount: 10, label: "10 JOD")
        buttons(amount: 20, label: "20 JOD")
        buttons(amount: 30, label: "30 JOD")
        buttons(amount: data.remainingEligAmount, label: String(data.remainingEligAmount) + " JOD")
      }
      .padding()
      
      HStack{
        DetailsTextView(text: "Amount")
        Spacer()
      }
      
      HStack{
        IconTextView(text: String(Data.amountToWithdraw))
        Spacer()
        IconTextView(text: "JOD")
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color("GrayLight"))
          .frame(width: 382)
      )
      
      DetailsTextView(text: "Maximum is the remaining eligibility amount and must be greater than or equal to the minimum withdrawal limit.").opacity(0.3)
      
    }
    .padding()
    
    Spacer()
    
    Button{
      isShowing.toggle()
    } label: {
      if selectedAmount == nil {
        ButtonLabelView(text: "Calculate", color: "HintText")
      } else {
        ButtonLabelView(text: "Calculate", color: "AccentColor")
      }
    }.frame(alignment: .bottom)
      .padding()
      .disabled(selectedAmount == nil)
    
      .sheet(isPresented: $isShowing){
        CalculateResultView(isShowing: $isShowing, transactions: $transactions)
          .presentationDetents([.height(355)])
          .presentationCornerRadius(30)
      }
  }
  
  private func buttons(amount: Double, label: String) -> some View {
    Button {
      selectedAmount = amount
      Data.amountToWithdraw = amount
    } label: {
      if selectedAmount == amount {
        SelectedAmountButtonView(text: label)
      } else {
        UnselectedAmountButtonView(text: label)
      }
    }
  }
  
}
