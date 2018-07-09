import UIKit
import Swift_SimpleNetworkLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let successHandler: ([Employee]) -> Void = { (employees) in
            print(employees)
        }
        let errorHandler: (String) -> Void = { (error) in
            print(error)
        }

        if let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") {
            NetworkLayer().get(url: url,
                               successHandler: successHandler,
                               errorHandler: errorHandler)
        }

        let emp1 = Employee(name: "Test_123", salary: "12234", age: "22")
        if let url = URL(string: "http://dummy.restapiexample.com/api/v1/create") {
            NetworkLayer().post(urlRequest: URLRequest(url: url), body: emp1)
        }
    }
}

struct Employee: Codable {
    let name: String
    let salary: String
    let age: String

    enum CodingKeys: String, CodingKey {
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
    }
}

