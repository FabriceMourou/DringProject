import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closingKeyboardGestureRecogniyer = UITapGestureRecognizer(
            target: self,
            action: #selector(closeKeyboard)
        )
        
        view.addGestureRecognizer(closingKeyboardGestureRecogniyer)

    }
    
    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
    


}
