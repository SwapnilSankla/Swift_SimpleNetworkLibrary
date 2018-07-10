//
//  Presenter.swift
//  Swift_SimpleNetworkLibrary_Example
//
//  Created by Swapnil Sankla on 10/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Swift_SimpleNetworkLibrary

class Presenter {

    let networkLayer: NetworkLayer
    var view: ViewProtocol?

    init(view: ViewProtocol,
         networkLayer: NetworkLayer = NetworkLayer()) {
        self.view = view
        self.networkLayer = networkLayer
    }

    func getExample() {
        let successHandler: ([Employee]) -> Void = { (employees) in
            print(employees)
            self.view?.displayEmployees(employees: employees)
        }
        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.view?.displayError(error: error)
        }

        networkLayer.get(urlString: "http://dummy.restapiexample.com/api/v1/employees",
                         successHandler: successHandler,
                         errorHandler: errorHandler)
    }

    func postExample() {
        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.view?.displayError(error: error)
        }
        let emp1 = Employee(name: "Test_123", salary: "12234", age: "22")
        networkLayer.post(urlString: "http://dummy.restapiexample.com/api/v1/create",
                          body: emp1,
                          errorHandler: errorHandler)
    }
}
