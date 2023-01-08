//
//  TheSportsFDJUITests.swift
//  TheSportsFDJUITests
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import XCTest

class TheSportsFDJUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testInputSearchBarAndTheSearchingProcess() {
        // First we Launch the application.
        app.launch()
        // Check the existance of the searchBar.
        let searchField = app.searchFields["Search by league"]
        XCTAssertTrue(searchField.exists)
        // We tap inside the saarch bar and we set the query.
        searchField.tap()
        searchField.typeText("NHL")
        // Check the existance of the keyboard.
        let keyboard = app.keyboards.element(boundBy: 0)
        XCTAssertTrue(keyboard.exists)
        // we tap the search button on keyboard .
        keyboard.buttons["rechercher"].tap()
        
        /*
           Get the first item in collection that match our search query,
           and navigate to the details page.
         */
        let firstItem = app.collectionViews.cells.element(boundBy:0)
        firstItem.tap()
        // Go back to the home page.
        app.buttons["Back"].tap()
    }
}
