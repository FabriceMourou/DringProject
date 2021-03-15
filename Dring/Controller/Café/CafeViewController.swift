

import UIKit

class CafeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Café"
    
        cafeTextView.layer.cornerRadius = 10
    }
    
   
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var cafeTextView: UITextView!
    
    
    @IBAction func tapAdressTextFied() {
    }
    
}
