//
//  TargetView.swift
//  TransferableOwner
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct TargetView: View {
    @State private var droppedProfile: RMProfile? = nil
    @State private var nameValue: String = ""

    var body: some View {
        Group {
            if droppedProfile == nil {
                VStack {
                    Spacer()
                    Text("Drop here!")
                    Spacer()
                }
            } else {
                VStack {
                    AsyncImage(
                        url: URL(string: droppedProfile!.avatar)
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(droppedProfile!.name)
                    TextField("Name here", text: $nameValue)
                        .dropDestination(for: String.self) { items, location in
                            guard let profileName = items.first else { return false }
                            self.nameValue = profileName
                            return true
                        }
                    Button {
                        UIPasteboard.general.setData(
                            try! JSONEncoder().encode(droppedProfile!),
                            forPasteboardType: UTType.rmprofile.identifier
                        )
                    } label: {
                        Text("COPY")
                    }
                    ShareLink(
                        item: droppedProfile!,
                        preview: SharePreview(
                            droppedProfile!.name,
                            image: droppedProfile!.avatar
                        )
                    )
                }
            }
        }
        .dropDestination(for: RMProfile.self) { items, location in
            guard let profileItem = items.first else { return false }
            self.droppedProfile = profileItem
            return true
        }
    }
}
