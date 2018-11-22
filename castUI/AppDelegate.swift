import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusBar: NSStatusItem?

    private var recordItem: NSMenuItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        print(CommandLine.arguments)
        if CommandLine.argc > 1 {
            Config.processName = CommandLine.arguments[1]
        }
        Recorder.setup()
    }

    override func awakeFromNib() {
        statusBar = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusBar?.title = "cast"
        statusBar?.highlightMode = true
        statusBar?.menu = createMenu()
    }

    private func createMenu() -> NSMenu? {
        let menu = NSMenu(title: "cast")

        recordItem = NSMenuItem(title: "Record", action: #selector(record), keyEquivalent: "")
        menu.addItem(recordItem!)

        let exitItem = NSMenuItem(title: "Exit", action: #selector(exit), keyEquivalent: "")
        menu.addItem(exitItem)

        return menu
    }

    func record() {
        Recorder.record()
    }

    func exit() {
        NSApp.terminate(nil)
    }
}
