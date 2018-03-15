//
// Created by jetbrains on 03/05/2017.
// Copyright (c) 2017 JetBrains. All rights reserved.
//

import Foundation
import ApplicationServices
import AppKit


class Recorder {
    class func record() -> Void {
        let start = CGPoint(x: Config.x, y: Config.y + Config.titleHeight)
        let end = CGPoint(x: Config.right, y: Config.down)

        for app in NSWorkspace.shared().runningApplications {
            if app.localizedName == "AppCode-EAP" || app.localizedName == "AppCode" {
                Config.processName = app.localizedName!
                break
            }
        }

        let activateScpt: NSAppleScript? = NSAppleScript(source: Config.activateAppCodeScpt)
        let recordScpt: NSAppleScript? = NSAppleScript(source: Config.recordScpt)
        let bringToFrontScpt: NSAppleScript? = NSAppleScript(source: Config.bringToFrontScpt)

        var error: NSDictionary? = nil

        bringToFrontScpt?.executeAndReturnError(&error)
        activateScpt?.executeAndReturnError(&error)
        recordScpt?.executeAndReturnError(&error)
        Mouse.drag(start: start, end: end)
    }
}
