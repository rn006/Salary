//
//  Shapes.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//
import SwiftUI

struct CircleView: View {
  var systemName: String
  var width: CGFloat
  var height: CGFloat
  var body: some View {
    Image(systemName: systemName)
      .font(.kanitSB18)
      .foregroundColor(.accentColor)
      .frame(width: width, height: height)
      .background(
        Circle()
          .fill(Color("IconBackground"))
      )
  }
}

struct SelectedRoundedRectView: View {
  var text: String
  var body: some View {
    ButtonTextView(text: text)
      .frame(width: 186, height: Constants.buttonTextFrameHeight)
      .background(
        RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusSmall)
          .fill(.accent)
      )
  }
}

struct UnselectedRoundedRectView: View {
  var text: String
  var body: some View {
    UnselectedButtonTextView(text: text)
      .frame(width: 186, height: Constants.buttonTextFrameHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusSmall)
          .stroke(lineWidth: 1)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct BackArrowView: View {
  var body: some View {
    Image(systemName:"arrow.left")
      .foregroundColor(.accentColor)
  }
}

struct UnselectedAmountButtonView: View {
  var text: String
  var body: some View {
    DetailsTextView(text: text)
      .padding(10)
      .frame(width: 85, height: 37)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusLarge)
          .stroke(lineWidth: 1)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct SelectedAmountButtonView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit14)
      .foregroundColor(.white)
      .padding(10)
      .frame(width: 85, height: 37)
      .background(
        RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusLarge)
          .fill(.accent)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct StrokeRectView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusMedium)
      .stroke(lineWidth: 1)
      .foregroundColor(Color("IconBackground"))
  }
}

struct Line: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    return path
  }
}

struct DashedLineView: View {
  var body: some View {
    Line()
      .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
      .frame(height: 1)
      .foregroundColor(Color("IconBackground"))
  }
}

struct ButtonLabelView: View {
  var text: String
  var color: String
  var body: some View {
    ButtonTextView(text: text)
      .frame(maxWidth: .infinity, maxHeight: Constants.buttonTextFrameHeight)
      .background(
        RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadiusSmall)
          .fill(Color(color))
      )
  }
}

struct OptionButtonView: View {
  let option: CalculateResultView.Option
  @Binding var selectedOption: CalculateResultView.Option
  var text: String
  var body: some View {
    
    HStack{
      Button{
        selectedOption = option
      } label: {
        Image(systemName: selectedOption == option ? "checkmark.circle.fill" : "circle")
      }
      OptionButtonTextView(text: text)
      Spacer()
    }
    
  }
}

func createIcon(systemName: String, text: String) -> some View {
  VStack {
    CircleView(systemName: systemName, width: 60, height: 60)
    IconTextView(text: text)
  }
}

struct ShapesPreviews: PreviewProvider {
  static var previews: some View {
    VStack {
      CircleView(systemName: "plus.circle.fill", width: 60, height: 60)
      SelectedRoundedRectView(text: "Request")
      UnselectedRoundedRectView(text: "History")
      BackArrowView()
      UnselectedAmountButtonView(text: "10 JOD")
      SelectedAmountButtonView(text: "20 JOD")
    }
    .padding()
  }
}
