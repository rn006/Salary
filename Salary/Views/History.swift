//
//  History.swift
//  Salary
//
//  Created by Raya on 21/08/2025.
//

import SwiftUI

struct historyView: View {
  @Binding var isHidden: Bool
  @Binding var transactions: [Transaction]
  var body: some View {
    ScrollView{
      ForEach(transactions) { transaction in
        transactionsView(isHidden: $isHidden, transaction: transaction)
      }
    }
  }
}
