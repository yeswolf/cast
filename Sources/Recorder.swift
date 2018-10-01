//
// Created by jetbrains on 03/05/2017.
// Copyright (c) 2017 JetBrains. All rights reserved.
//

import Foundation
import ApplicationServices
import AppKit

class Recorder {
    public static var recording = false

    class func record() -> Void {
        Recorder.recording = true
        let start = CGPoint(x: Config.x, y: Config.y + Config.titleHeight)
        let end = CGPoint(x: Config.right, y: Config.down)

        let activateScpt: NSAppleScript? = NSAppleScript(source: Config.activateAppCodeScpt)
        let recordScpt: NSAppleScript? = NSAppleScript(source: Config.recordScpt)
        let bringToFrontScpt: NSAppleScript? = NSAppleScript(source: Config.bringToFrontScpt)

        var error: NSDictionary? = nil

        bringToFrontScpt?.executeAndReturnError(&error)
        activateScpt?.executeAndReturnError(&error)
        recordScpt?.executeAndReturnError(&error)
        Mouse.drag(start: start, end: end)
    }

    class func stop () {
        Recorder.recording = false
    }

    class func setup() {
        let prompt = kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString
        let dict: CFDictionary = [prompt: true] as CFDictionary
        AXIsProcessTrustedWithOptions(dict)
    }
}
