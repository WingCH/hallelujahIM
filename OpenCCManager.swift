//
//  OpenCCManager.swift
//  hallelujah
//
//  Created by Wing on 23/6/2024.
//

import Foundation
import OpenCC

@objc class OpenCCManager: NSObject {
    private let converter: ChineseConverter?

    @objc override init() {
        do {
            converter = try ChineseConverter(options: [.traditionalize, .twStandard, .twIdiom])
        } catch {
            fatalError("Failed to initialize ChineseConverter: \(error)")
        }
        super.init()
    }
    
    @objc func convert(_ text: String) -> String {
        return converter?.convert(text) ?? text
    }
}
