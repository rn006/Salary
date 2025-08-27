//
//  Salary.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct SalaryView: View {
  var body: some View {
    
    NavigationStack{
      TopViewSalary()
      
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

struct TopViewSalary: View {
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
            SelectedRoundedRectView(text: "Request")
          } else {
            UnselectedRoundedRectView(text: "Request")
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
            SelectedRoundedRectView(text: "History")
          } else {
            UnselectedRoundedRectView(text: "History")
          }
        }
        
      }
      
      //Show/Hide Request and History Pages
      VStack {
        if !isRequestPageHidden {
          RequestView(isHidden: $isRequestPageHidden, transactions: $transactions)
        }
        if !isHistoryPageHidden {
          HistoryView(isHidden: $isHistoryPageHidden, transactions: $transactions)
        }
      }
      
    }
    
  }
}




#Preview {
  SalaryView()
}

