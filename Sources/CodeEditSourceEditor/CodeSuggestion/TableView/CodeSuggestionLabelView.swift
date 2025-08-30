//
//  CodeSuggestionLabelView.swift
//  CodeEditSourceEditor
//
//  Created by Khan Winter on 7/24/25.
//

import AppKit
import SwiftUI

struct CodeSuggestionLabelView: View {
    static let HORIZONTAL_PADDING: CGFloat = 11

    let suggestion: CodeSuggestionEntry
    let labelColor: NSColor
    let secondaryLabelColor: NSColor
    let font: NSFont

    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            suggestion.image
                .foregroundStyle(Color.gray.opacity(0.6), suggestion.deprecated ? .gray.opacity(0.3) : suggestion.imageColor)
                .frame(width: 18) //+ vertically center all

            // Main label
            HStack(spacing: font.charWidth) {
                Text(suggestion.label)
                    .foregroundStyle(suggestion.deprecated ? Color(secondaryLabelColor) : Color(labelColor))

                if let detail = suggestion.detail {
                    Text(detail)
                        .foregroundStyle(Color(secondaryLabelColor))
                }
            }

            Spacer(minLength: 0)

            // Right side indicators
            if suggestion.deprecated {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(Color(labelColor), Color(secondaryLabelColor))
            }
        }
        //+ shrink font slightly
        .font(Font(font.withSize(font.pointSize * 0.95)))
        .padding(.vertical, 3)
        .padding(.horizontal, Self.HORIZONTAL_PADDING)
        .buttonStyle(PlainButtonStyle())
    }
}
