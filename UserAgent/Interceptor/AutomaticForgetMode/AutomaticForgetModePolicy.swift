//
// Copyright (c) 2017-2019 Cliqz GmbH. All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation

class AutomaticForgetModePolicy: NSObject, InterceptorPolicy {
    let type: InterceptorType = .automaticForgetMode

    private var queue = DispatchQueue.global(qos: .background)
    private let detector: AutomaticForgetModeDetector
    private var whitelistedURL: URL?

    override init() {
        self.detector = AutomaticForgetModeDetector()
    }

    func canLoad(url: URL, onPostFactumCheck: PostFactumCallback?) -> Bool {
        guard self.whitelistedURL?.baseDomain != url.baseDomain else {
            self.whitelistedURL = nil
            return true
        }

        if self.detector.isAutomaticForgetURL(url) {
            onPostFactumCheck?(url, self)
            return false
        }

        return true
    }

    func whitelistUrl(_ url: URL) {
        self.whitelistedURL = url
    }
}
