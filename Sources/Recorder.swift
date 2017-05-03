//
// Created by jetbrains on 03/05/2017.
// Copyright (c) 2017 JetBrains. All rights reserved.
//

import Foundation
class Recorder {
    class func record() -> Void {
        let start = CGPoint(x: Config.x, y: Config.y + Config.titleHeight)
        let end = CGPoint(x: Config.right, y: Config.down)

        let activateScpt: NSAppleScript? = NSAppleScript(source: Config.activateAppCodeScpt)
        let recordScpt: NSAppleScript? = NSAppleScript(source: Config.recordScpt)

        var error: NSDictionary? = nil
        activateScpt?.executeAndReturnError(&error)
        recordScpt?.executeAndReturnError(&error)
        Mouse.drag(start: start, end: end)
    }
}