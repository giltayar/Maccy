import XCTest
@testable import Maccy

class HistoryMenuItemTests: XCTestCase {
  func testTitleShorterThanMaxLength() {
    let title = String(repeating: "a", count: 49)
    let menuItem = HistoryMenuItem(title: title, onSelected: { _ in })
    XCTAssertEqual(menuItem.title, title)
    XCTAssertEqual(menuItem.title.count, 49)
    XCTAssertEqual(menuItem.fullTitle, title)
    XCTAssertEqual(menuItem.toolTip, tooltip(title))
  }

  func testTitleOfMaxLength() {
    let title = String(repeating: "a", count: 50)
    let menuItem = HistoryMenuItem(title: title, onSelected: { _ in })
    XCTAssertEqual(menuItem.title, title)
    XCTAssertEqual(menuItem.title.count, 50)
    XCTAssertEqual(menuItem.fullTitle, title)
    XCTAssertEqual(menuItem.toolTip, tooltip(title))
  }

  func testTitleLongerThanMaxLength() {
    let title = String(repeating: "a", count: 51)
    let menuItem = HistoryMenuItem(title: title, onSelected: { _ in })
    XCTAssertEqual(menuItem.title, "\(title)...")
    XCTAssertEqual(menuItem.title.count, 54)
    XCTAssertEqual(menuItem.fullTitle, title)
    XCTAssertEqual(menuItem.toolTip, tooltip(title))
  }

  func testTitleWithWhitespaces() {
    let title = "   foo   "
    let menuItem = HistoryMenuItem(title: title, onSelected: { _ in })
    XCTAssertEqual(menuItem.title, "foo")
    XCTAssertEqual(menuItem.fullTitle, title)
    XCTAssertEqual(menuItem.toolTip, tooltip(title))
  }

  private func tooltip(_ title: String) -> String {
    return """
           \(title)\n \n
           Press ⌥+⌫ to delete.
           """
  }
}
