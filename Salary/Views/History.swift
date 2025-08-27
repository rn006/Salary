//
//  History.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//

import SwiftUI

struct HistoryView: View {
  @Binding var isHidden: Bool
  @Binding var transactions: [Transaction]
  var body: some View {
    ScrollView{
      ForEach(transactions) { transaction in
        TransactionsView(isHidden: $isHidden, transaction: transaction)
      }
    }
  }
}
