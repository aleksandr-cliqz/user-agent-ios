//
// Copyright (c) 2017-2019 Cliqz GmbH. All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import Shared

extension WTMCategory {
    /// Return all possible WTMCategory values in default ordering. (always try to use this ordering for consistency reasons)
    static func all() -> [WTMCategory] {
        [
            advertising, analytics, content, social, essential, misc, hosting, pornvertising,
            audioVideoPlayer, extensions, customerInteraction, comments, cdn, unknown,
        ]
    }

    /// Convert the stats object into a dictionary with TPPageStatsType as Keys
    static func statsDict(from stats: TPPageStats) -> [WTMCategory: Int] {
        var dict = [WTMCategory: Int]()

        dict[.advertising] = stats.adCount
        dict[.analytics] = stats.analyticCount
        dict[.content] = stats.contentCount
        dict[.social] = stats.socialCount
        dict[.essential] = stats.essentialCount
        dict[.misc] = stats.miscCount
        dict[.hosting] = stats.hostingCount
        dict[.pornvertising] = stats.pornvertisingCount
        dict[.audioVideoPlayer] = stats.audioVideoPlayerCount
        dict[.extensions] = stats.extensionsCount
        dict[.customerInteraction] = stats.customerInteractionCount
        dict[.cdn] = stats.cdnCount
        dict[.unknown] = stats.unknownCount

        return dict
    }

    var color: UIColor {
        switch self {
        case .advertising:
            return UIColor(named: "Advertising")!
        case .analytics:
            return UIColor(named: "SiteAnalytics")!
        case .content:
            return UIColor(named: "Advertising")!
        case .social:
            return UIColor(named: "SocialMedia")!
        case .essential:
            return UIColor(named: "Essential")!
        case .misc:
            return UIColor(named: "Misc")!
        case .hosting:
            return UIColor(named: "Hosting")!
        case .pornvertising:
            return UIColor(named: "Pornvertising")!
        case .audioVideoPlayer:
            return UIColor(named: "AudioVideoPlayer")!
        case .extensions:
            return UIColor(named: "Extensions")!
        case .customerInteraction:
            return UIColor(named: "CustomerInteraction")!
        case .comments:
            return UIColor(named: "Comments")!
        case .cdn:
            return UIColor(named: "Cdn")!
        default:
            return UIColor(named: "Unknown")!
        }
    }

    var localizedName: String {
        switch self {
        case .advertising:
            return Strings.Menu.TrackingProtectionAdsBlocked
        case .analytics:
            return Strings.Menu.TrackingProtectionAnalyticsBlocked
        case .content:
            return Strings.Menu.TrackingProtectionContentBlocked
        case .social:
            return Strings.Menu.TrackingProtectionSocialBlocked
        case .essential:
            return Strings.Menu.TrackingProtectionEssentialBlocked
        case .misc:
            return Strings.Menu.TrackingProtectionMiscBlocked
        case .hosting:
            return Strings.Menu.TrackingProtectionHostingBlocked
        case .pornvertising:
            return Strings.Menu.TrackingProtectionPornvertisingBlocked
        case .audioVideoPlayer:
            return Strings.Menu.TrackingProtectionAudioVideoPlayerBlocked
        case .extensions:
            return Strings.Menu.TrackingProtectionExtensionsBlocked
        case .customerInteraction:
            return Strings.Menu.TrackingProtectionCustomerInteractionBlocked
        case .comments:
            return Strings.Menu.TrackingProtectionCommentsBlocked
        case .cdn:
            return Strings.Menu.TrackingProtectionCDNBlocked
        default:
            return Strings.Menu.TrackingProtectioUnknownBlocked
        }
    }
}
