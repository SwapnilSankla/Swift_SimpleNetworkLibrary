import UIKit
import Swift_SimpleNetworkLibrary

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = Presenter(view: self)
        presenter.getExample()
        presenter.postExample()
    }
}

extension ViewController: ViewProtocol {
    func displayEmployees(employees: [Employee]) {

    }

    func displayError(error: String) {

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

