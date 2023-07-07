//
//  DropDownView.swift
//  AnimatedDropDown
//
//  Created by Nikolai Baklanov on 07.07.2023.
//

import SwiftUI

struct DropDownView: View {
    @Binding var selected: String

    var content: [String]
    var activeTint: Color
    var inActiveTint: Color
    var dynamic: Bool

    @State private var expanded = false

    var body: some View {
        GeometryReader { geom in
            VStack(alignment: .leading, spacing: 0) {
                if !dynamic {
                    DropDownItem(
                        title: selected,
                        size: geom.size,
                        selected: true,
                        selectedColor: activeTint
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(
                            .interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)
                        ) {
                            if expanded {
                                expanded = false
                            } else {
                                expanded = true
                            }
                        }
                    }
                }
                ForEach(
                    content.filter { item in
                        dynamic ? true : item != selected
                    },
                    id: \.self
                ) { title in
                    DropDownItem(
                        title: title,
                        size: geom.size,
                        selected: title == selected,
                        selectedColor: activeTint
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(
                            .interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)
                        ) {
                            if expanded {
                                selected = title
                                expanded = false
                            } else {
                                if selected == title {
                                    expanded = true
                                }
                            }
                        }
                    }
                }
            }
            .background {
                Rectangle()
                    .fill(inActiveTint)
                    .transition(.identity)
            }
            .offset(
                y: dynamic
                    ? (CGFloat(content.firstIndex(of: selected) ?? 0) * -55)
                    : 0.0
            )
        }
        .frame(height: 55.0)
        .overlay(alignment: .trailing) {
            Image(systemName: "chevron.up.chevron.down")
                .padding(.trailing, 10)
        }
        .mask(alignment: .top) {
            Rectangle()
                .frame(height: expanded ? CGFloat(55 * content.count) : 55)
                .offset(
                    y: expanded && dynamic
                    ? (CGFloat(content.firstIndex(of: selected) ?? 0) * -55)
                    : 0.0
                )
        }
        .zIndex(1000)
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DropDownView(
                selected: Binding.constant("Easy"),
                content: items,
                activeTint: .primary.opacity(0.1),
                inActiveTint: .white.opacity(0.05),
                dynamic: true
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}
