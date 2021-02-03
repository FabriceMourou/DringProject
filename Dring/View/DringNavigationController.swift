import UIKit

class DringNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true

        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        navigationBar.largeTitleTextAttributes = textAttributes
    }
    
   
}

