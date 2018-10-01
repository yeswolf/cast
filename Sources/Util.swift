//
// Created by jetbrains on 15/03/2018.
// Copyright (c) 2018 JetBrains. All rights reserved.
//

import Foundation

class Util {
    class func killall(app: String) {
        let pipe = Pipe()

        let task = Process()
        task.launchPath = "/usr/bin/killall"
        task.arguments = [app]
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print(output)
        }
    }
}
