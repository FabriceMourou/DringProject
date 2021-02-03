import UIKit

class RestoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Restaurant"
        
      
        restoTextView.layer.cornerRadius = 10
    }
    

  
    @IBOutlet weak var restoTextView: UITextView!
}
