//
//  Shapes.swift
//  Salary
//
//  Created by Raya on 20/08/2025.
//
import SwiftUI

struct circleView: View {
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

struct selectedRoundedRectView: View {
  var text: String
  var body: some View {
    buttonText(text: text)
      .frame(width: 186, height: 52)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(.accent)
      )
  }
}

struct unselectedRoundedRectView: View {
  var text: String
  var body: some View {
    unselectedButtonText(text: text)
      .frame(width: 186, height: 52)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(lineWidth: 1)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct backArrow: View {
  var body: some View {
    Image(systemName:"arrow.left")
      .foregroundColor(.accentColor)
  }
}

struct unselectedAmountButton: View {
  var text: String
  var body: some View {
    detailsText(text: text)
      .padding(10)
      .frame(width: 85, height: 37)
      .overlay(
        RoundedRectangle(cornerRadius: 1000)
          .stroke(lineWidth: 1)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct selectedAmountButton: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.kanit14)
      .foregroundColor(.white)
      .padding(10)
      .frame(width: 85, height: 37)
      .background(
        RoundedRectangle(cornerRadius: 1000)
          .fill(.accent)
          .foregroundColor(Color("IconBackground"))
      )
  }
}

struct strokeRectView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 12)
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

struct dashedLine: View {
  var body: some View {
    Line()
      .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
      .frame(height: 1)
      .foregroundColor(Color("IconBackground"))
  }
}

struct buttonLabel: View {
  var text: String
  var color: String
  var body: some View {
    buttonText(text: text)
      .frame(maxWidth: .infinity, maxHeight: 52)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(Color(color))
      )
  }
}

struct optionButton: View {
  let option: calculateResultView.Option
  @Binding var selectedOption: calculateResultView.Option
  var text: String
  var body: some View {
    
    HStack{
      Button{
        selectedOption = option
      } label: {
        Image(systemName: selectedOption == option ? "checkmark.circle.fill" : "circle")
      }
      optionButtonText(text: text)
      Spacer()
    }
    
  }
}

struct shapesPreviews: PreviewProvider {
  static var previews: some View {
    VStack {
      circleView(systemName: "plus.circle.fill", width: 60, height: 60)
      selectedRoundedRectView(text: "Request")
      unselectedRoundedRectView(text: "History")
      backArrow()
      unselectedAmountButton(text: "10 JOD")
      selectedAmountButton(text: "20 JOD")
    }
    .padding()
  }
}
