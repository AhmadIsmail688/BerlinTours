//
//  PaginationHelper.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/17/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

struct PaginationHelper {
    static let defaultLimit = 10
    static func parameters(page: Int, limitPerPage: Int = defaultLimit) -> [String: Any] {
        let pageIndex = page - 1
        return [
            "offset": pageIndex * limitPerPage,
            "limit": limitPerPage
        ]
    }
}
