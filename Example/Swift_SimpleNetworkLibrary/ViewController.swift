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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

struct Employee: Codable {
    let employee_name: String
    let employee_salary: String
    let employee_age: String
}

