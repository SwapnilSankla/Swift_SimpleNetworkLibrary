import UIKit
import Swift_SimpleNetworkLibrary

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        getExample()
        postExample()
    }

    private func getExample() {
        let successHandler: ([Employee]) -> Void = { (employees) in
            print(employees)
        }
        let errorHandler: (String) -> Void = { (error) in
            print(error)
        }

        NetworkLayer().get(urlString: "http://dummy.restapiexample.com/api/v1/employees",
                           successHandler: successHandler,
                           errorHandler: errorHandler)
    }

    private func postExample() {
        let errorHandler: (String) -> Void = { (error) in
            print(error)
        }
        let emp1 = Employee(name: "Test_123", salary: "12234", age: "22")
        NetworkLayer().post(urlString: "http://dummy.restapiexample.com/api/v1/create",
                            body: emp1,
                            errorHandler: errorHandler)
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

