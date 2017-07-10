import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    //    @IBOutlet weak var window: NSWindow!

    private var statusBar: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
