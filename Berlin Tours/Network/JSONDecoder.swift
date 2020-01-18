//
//  JSONDecoder.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

struct JsonDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(SpecialDateFormatter.networkFormat)
        return decoder
    }()
}
