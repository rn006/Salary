//
//  Text.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//

import SwiftUI

struct TitlesView: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-0.3)
      .font(.kanit20)
      .fontWeight(.medium)
      .foregroundColor(.accentColor)
  }
}


struct IconTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitMed)
      .kerning(-0.2)
      .foregroundColor(.accentColor)
  }
}

//for amount buttons + less opacity text, do opacity + color in main code
struct DetailsTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit14)
      .kerning(-0.2)
  }
}

struct DetailsSBView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitSB14)
      .kerning(-0.2)
  }
}

struct ButtonTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitSB)
      .kerning(-0.2)
      .foregroundColor(Color("ButtonText"))
  }
}

struct UnselectedButtonTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit16)
      .kerning(-0.2)
      .foregroundColor(Color("HintText"))
  }
}

struct KanitLightView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanitLight)
      .opacity(0.3)
  }
}

struct GreenTextView: View {
  var text: String
  var body: some View {
    Text(text)
    .font(.kanitSB)
    .kerning(-0.2)
    .foregroundColor(Color("GreenStatus"))
  }
}

func showDetails(text1: String, text2: String) -> some View {
  HStack {
    DetailsTextView(text: text1).opacity(0.3)
    Spacer()
    DetailsSBView(text: text2)
  }
}

struct OptionButtonTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.callout)
      .foregroundColor(.accent)
  }
}

struct FootnoteTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.footnote)
      .bold()
  }
}

struct TextPreviewsView: PreviewProvider {
  static var previews: some View {
    VStack {
      TitlesView(text: "All Services")
      IconTextView(text: "icon")
      DetailsTextView(text: "details")
    }
    .padding()
  }
}
