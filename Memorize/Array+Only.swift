//
//  Array+Only.swift
//  Memorize
//
//  Created by Kyoji Goto on 2020-05-28.
//  Copyright © 2020 Kyoji Goto. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
