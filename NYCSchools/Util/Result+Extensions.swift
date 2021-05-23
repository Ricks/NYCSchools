//
//  Result+Extensions.swift
//  Jigsaw
//
//  Created by Richard Clark on 3/18/20.
//  Copyright © 2020 Richard Clark. All rights reserved.
//

import Foundation

extension Result {
    var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }

    var isSuccess: Bool {
        return success != nil
    }
    
    var failure: Failure? {
        guard case let .failure(value) = self else { return nil }
        return value
    }
}
