//
//  Protocols.swift
//  Swift_SimpleNetworkLibrary_Example
//
//  Created by Swapnil Sankla on 10/07/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

protocol ViewProtocol: class {
    func displayEmployees(employees: [Employee])
    func displayError(error: String)
}
