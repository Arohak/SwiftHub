//
//  SettingsSection.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 7/23/18.
//  Copyright © 2018 Khoren Markosyan. All rights reserved.
//

import Foundation
import RxDataSources

enum SettingsSection {
    case setting(title: String, items: [SettingsSectionItem])
}

enum SettingsSectionItem {
    case settingItem(viewModel: SettingCellViewModel)
    case settingThemeItem(viewModel: SettingThemeCellViewModel)
}

extension SettingsSection: SectionModelType {
    typealias Item = SettingsSectionItem

    var title: String {
        switch self {
        case .setting(let title, _): return title
        }
    }

    var items: [SettingsSectionItem] {
        switch  self {
        case .setting(_, let items): return items.map {$0}
        }
    }

    init(original: SettingsSection, items: [Item]) {
        switch original {
        case .setting(let title, let items): self = .setting(title: title, items: items)
        }
    }
}
