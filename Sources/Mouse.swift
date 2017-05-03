import Foundation

class Mouse {
	static func drag(start: CGPoint, end: CGPoint) {
		let mouseDown = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDown, mouseCursorPosition: start, mouseButton: CGMouseButton.left)
		let mouseDrag = CGEvent(mouseEventSource: nil, mouseType: .leftMouseDragged, mouseCursorPosition: end, mouseButton: CGMouseButton.left)
		let mouseUp = CGEvent(mouseEventSource: nil, mouseType: .leftMouseUp, mouseCursorPosition: end, mouseButton: CGMouseButton.left)

		mouseDown?.post(tap: .cghidEventTap)
		usleep(Config.delay)
		mouseDrag?.post(tap: .cghidEventTap)
		usleep(Config.delay)
		mouseUp?.post(tap: .cghidEventTap)
	}
}
