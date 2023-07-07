//
//  DropDownItem.swift
//  AnimatedDropDown
//
//  Created by Nikolai Baklanov on 07.07.2023.
//

import SwiftUI

struct DropDownItem: View {
    var title: String
    var size: CGSize
    var selected: Bool
    var selectedColor: Color

    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .frame(width: size.width, height: size.height, alignment: .leading)
            .background {
                if selected {
                    Rectangle()
                        .fill(selectedColor)
                }
            }
    }
}

struct DropDownItem_NotSelectedPreviews: PreviewProvider {
    static var previews: some View {
        DropDownItem(
            title: items.first ?? "Easy",
            size: CGSize(width: 133, height: 55),
            selected: false,
            selectedColor: .primary.opacity(0.1)
        )
    }
}

struct DropDownItem_SelectedPreviews: PreviewProvider {
    static var previews: some View {
        DropDownItem(
            title: items.first ?? "Easy",
            size: CGSize(width: 133, height: 55),
            selected: true,
            selectedColor: .primary.opacity(0.1)
        )
    }
}
