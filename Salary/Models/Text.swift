//
//  Text.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct titles: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-0.3)
      .font(.kanit20)
      .fontWeight(.medium)
      .foregroundColor(.accentColor)
  }
}


struct iconText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitMed)
      .kerning(-0.2)
      .foregroundColor(.accentColor)
  }
}

//for amount buttons + less opacity text, do opacity + color in main code
struct detailsText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit14)
      .kerning(-0.2)
  }
}

struct detailsSB: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitSB14)
      .kerning(-0.2)
  }
}

struct buttonText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitSB)
      .kerning(-0.2)
      .foregroundColor(Color("ButtonText"))
  }
}

struct unselectedButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit16)
      .kerning(-0.2)
      .foregroundColor(Color("HintText"))
  }
}

struct kanitLight: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitLight)
      .opacity(0.3)
  }
}

struct greenText: View {
  var text: String
  var body: some View {
    Text(text)
    .font(.kanitSB)
    .kerning(-0.2)
    .foregroundColor(Color("GreenStatus"))
  }
}

func details(text1: String, text2: String) -> some View {
  HStack {
    detailsText(text: text1).opacity(0.3)
    Spacer()
    detailsSB(text: text2)
  }
}

struct optionButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.callout)
      .foregroundColor(.accent)
  }
}

struct footnoteText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.footnote)
      .bold()
  }
}

struct textPreviews: PreviewProvider {
  static var previews: some View {
    VStack {
      titles(text: "All Services")
      iconText(text: "icon")
      detailsText(text: "details")
    }
    .padding()
  }
}
