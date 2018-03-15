import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusBar: NSStatusItem?

    private func checkAccessibility() {
        let prompt = kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString
        let dict: CFDictionary = [prompt: true] as CFDictionary
        AXIsProcessTrustedWithOptions(dict)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)
//        checkAccessibility()
    }
    
    override func awakeFromNib() {
        statusBar = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusBar?.title = "cast"
        statusBar?.highlightMode = true
        statusBar?.menu = createMenu()
    }

    private func createMenu() -> NSMenu? {
        let menu = NSMenu(title: "cast")
        let menuItem = NSMenuItem(title: "Record", action: #selector(record), keyEquivalent: "")
        menu.addItem(menuItem)
        let exitItem = NSMenuItem(title: "Exit", action: #selector(exit), keyEquivalent: "")
        menu.addItem(exitItem)
        return menu
    }

    @objc func record() {
        Recorder.record()
    }

    @objc func exit() {
        NSApp.terminate(nil)
    }
}
