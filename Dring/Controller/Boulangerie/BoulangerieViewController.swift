
import UIKit

class BoulangerieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Boulangerie"
     
        boulangerieTextView.layer.cornerRadius = 10
     
    }
    
   
    @IBOutlet weak var boulangerieTextView: UITextView!
    
  

}
