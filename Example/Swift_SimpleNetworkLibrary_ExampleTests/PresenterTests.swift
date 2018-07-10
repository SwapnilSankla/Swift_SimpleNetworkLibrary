//
//  Swift_SimpleNetworkLibrary_ExampleTests.swift
//  Swift_SimpleNetworkLibrary_ExampleTests
//
//  Created by Swapnil Sankla on 10/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import Swift_SimpleNetworkLibrary
@testable import Swift_SimpleNetworkLibrary_Example

class PresenterTests: XCTestCase {
    let view = DummyViewController()
    let networkLayer = DummyNetworkLayer()

    func test_getExample_callsDisplayEmployees_onSuccess() {
        networkLayer.successResponse = [Employee(name: "Swapnil",
                                                 salary: "123456",
                                                 age: "30")]
        Presenter(view: view, networkLayer: networkLayer).getExample()
        XCTAssertTrue(view.displayEmployeesCalled)
    }

    func test_getExample_callsDisplayError_onError() {
        networkLayer.errorResponse = "Unable to parse response"
        Presenter(view: view, networkLayer: networkLayer).getExample()
        XCTAssertTrue(view.displayErrorCalled)
    }

    func test_postExample_callsDisplayError_onError() {
        networkLayer.errorResponse = "Unable to parse response"
        Presenter(view: view, networkLayer: networkLayer).postExample()
        XCTAssertTrue(view.displayErrorCalled)
    }
}

class DummyViewController: ViewProtocol {
    var displayEmployeesCalled = false
    var displayErrorCalled = false

    func displayEmployees(employees: [Employee]) {
        displayEmployeesCalled = true
    }

    func displayError(error: String) {
        displayErrorCalled = true
    }
}
