

import UIKit

class CafeViewController: BaseViewController {
    
    let placeSearchManager = PlaceSearchManager()
    let alertManager = AlertManager()
    
    var placeResult: [PlaceResult] = []
    
    var place: String = "" {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Café"
    
        cafeTextView.layer.cornerRadius = 10
        aroundMeButton.layer.cornerRadius = 5
    }
    
   
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var cafeTextView: UITextView!
    @IBOutlet weak var aroundMeButton: UIButton!
    
    
    @IBAction func didTapPlaceButton() {
        displayPlaces(place: placeTextField.text)
       
    }
    
    
    
    @IBAction func clearAdressTextField(_ sender: Any) {
        placeTextField.text?.removeAll()
    }
    
    
    
    private func displayPlaces(place: String?) {
        placeSearchManager.fetchPlacesFrom(place: place!) { [weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
            
                case .failure:
                    guard let self = self else { return }
                    self.alertManager.presentAlert(from: self, message: "Failed to get Places data")
                    
                case .success(let place):
                    self?.performSegue(withIdentifier: "GoToPlacesListSegue", sender: place)
                }
            }
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        if
            let cafePlaceListViewController = segue.destination as? CafePlaceListViewController,
            let places = sender as? [PlaceResult]
            {
            cafePlaceListViewController.places = places
            
        }
    }
    
    
}
