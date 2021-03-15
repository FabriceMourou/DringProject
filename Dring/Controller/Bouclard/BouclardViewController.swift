import UIKit

class BouclardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Bouclard"
       
        bouclardTextView.layer.cornerRadius = 10

    }
    
  
    @IBOutlet weak var bouclardTextView: UITextView!
    
 

}
