

import UIKit

class CafeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Café"
    
        cafeTextView.layer.cornerRadius = 10
        aroundMeButton.layer.cornerRadius = 5
    }
    
   
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var cafeTextView: UITextView!
    @IBOutlet weak var aroundMeButton: UIButton!
    
    
    @IBAction func didTapAdressTextFied() {
    }
    
    @IBAction func clearAdressTextField(_ sender: Any) {
        adressTextField.text?.removeAll()
    }
    
    
    
}
