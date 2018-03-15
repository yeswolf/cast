import Foundation

class Config {
    static let delay: useconds_t = 500_000
    static let x: CGFloat = 50
    static let y: CGFloat = 50
    static let width: CGFloat = 1280
    static let height: CGFloat = 720
    static let titleHeight: CGFloat = 22
    static let right = x + width
    static let down = y + height + titleHeight
    static var processName = "AppCode-EAP"

    static let activateAppCodeScpt = "tell application \"System Events\"\n" +
        "tell process \"\(processName)\"\n" +
        "activate\n" +
        "tell window 1\n" +
        "set position to {\(x),\(y)}\n" +
        "set size to {\(width),\(height + titleHeight)}\n" +
        "delay 2\n" +
        "end tell\n" +
        "end tell\n" +
        "end tell\n"


    static let bringToFrontScpt = "tell application \"\(processName)\"\n" +
        "activate\n" +
        "end tell\n"


    static let recordScpt = "tell application \"QuickTime Player\"\n" +
        "activate\n" +
        "new screen recording\n" +
        "delay 1\n" +
        "tell application \"System Events\" to key code 49\n" +
        "delay 1\n" +
        "end tell"

}
