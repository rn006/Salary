//
//  Withdrawal.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//

import SwiftUI

struct topWithdrawalView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var transactions: [Transaction]
  var body: some View {
    
    NavigationStack{
      withdrawalView(transactions: $transactions)
    }
    
    //Back Button
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button(action: {
          dismiss()
        }) {
          backArrow()
        }
      }
      ToolbarItem(placement: .principal){
        titles(text: "Salary")
      }
    }
    
  }
}

struct withdrawalView: View {
  @State private var selectedAmount: Double? = nil
  @State private var isDisabled: Bool = true
  @State private var isShowing: Bool = false
  @Binding var transactions: [Transaction]
  var data = Data()
  var body: some View {
    VStack {
      
      HStack {
        
        circleView(systemName: "bag.fill", width: 40, height: 40)
        
        VStack{
          
          HStack{
            detailsText(text: "Remaining Eligible Amount").opacity(0.3)
            Spacer()
          }
          
          HStack {
            iconText(text: String(data.remainingEligAmount) + " JOD")
            Spacer()
          }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
      }
      .overlay(
        strokeRectView()
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
        detailsText(text: "Amount")
        Spacer()
      }
      
      HStack{
        iconText(text: String(Data.amountToWithdraw))
        Spacer()
        iconText(text: "JOD")
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color("GrayLight"))
          .frame(width: 382)
      )
      
      detailsText(text: "Maximum is the remaining eligibility amount and must be greater than or equal to the minimum withdrawal limit.").opacity(0.3)
      
    }
    .padding()
    
    Spacer()
    
    Button{
      isShowing.toggle()
    } label: {
      if selectedAmount == nil {
        buttonLabel(text: "Calculate", color: "HintText")
      } else {
        buttonLabel(text: "Calculate", color: "AccentColor")
      }
    }.frame(alignment: .bottom)
      .padding()
      .disabled(selectedAmount == nil)
    
      .sheet(isPresented: $isShowing){
        calculateResultView(isShowing: $isShowing, transactions: $transactions)
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
        selectedAmountButton(text: label)
      } else {
        unselectedAmountButton(text: label)
      }
    }
  }
  
}
