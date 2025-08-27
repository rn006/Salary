//
//  Data.swift
//  Salary
//
//  Created by Raya on 25/08/2025.
//

import SwiftUI

struct Data {
  var maxEligAmount: Double = 38.333
  var remainingEligAmount: Double = 19.833
  var remainingWithdrawalNum: Int = 28
  static var amountToWithdraw: Double = 0
  var fees: Double = 1.000
  var tax: Double = 0.500
}

struct Transaction: Identifiable {
  let id = UUID()
  let date: String
  let amount: Double
  let currency: String
  let status: String
  let reference: String
  let time: String
}

func getDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter.string(from: Date())
}

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    return formatter.string(from: Date())
}

extension Double {
  func asCurrency() -> String {
    self.formatted(
      .number
      .precision(.fractionLength(3))
    )
  }
}


