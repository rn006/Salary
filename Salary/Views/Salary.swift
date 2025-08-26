//
//  Salary.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct salaryView: View {
  @Environment(\.dismiss) var dismiss
  var body: some View {
    
    NavigationStack{
      topViewSalary()
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

struct topViewSalary: View {
  @State var requestSelected: Bool = true
  @State var historySelected: Bool = false
  @State var isRequestPageHidden: Bool = false
  @State var isHistoryPageHidden: Bool = true
  @State private var transactions: [Transaction] = []
  var body: some View {
    
    VStack{
      
      HStack{
        
        //Request Button
        Button {
          requestSelected = true
          historySelected = false
          isRequestPageHidden = false
          isHistoryPageHidden = true
        } label: {
          if requestSelected {
            selectedRoundedRectView(text: "Request")
          } else {
            unselectedRoundedRectView(text: "Request")
          }
        }
        
        //History Button
        Button {
          historySelected = true
          requestSelected = false
          isHistoryPageHidden = false
          isRequestPageHidden = true
        } label: {
          if historySelected {
            selectedRoundedRectView(text: "History")
          } else {
            unselectedRoundedRectView(text: "History")
          }
        }
        
      }
      
      //Show/Hide Request and History Pages
      VStack {
          if !isRequestPageHidden {
            requestView(isHidden: $isRequestPageHidden, transactions: $transactions)
          }
          if !isHistoryPageHidden {
            historyView(isHidden: $isHistoryPageHidden, transactions: $transactions)
          }
      }
      
    }
    
  }
}



#Preview {
  salaryView()
}

