import UIKit

class CafePlaceListViewController: UIViewController {
    
    var places: [PlaceResult] = []
    
    
    @IBOutlet weak var placeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var place: [String] = [] {
        didSet {
            placeTableView.reloadData()
        }
    }
 
    
}

extension CafePlaceListViewController: UITableViewDelegate {
    
}

extension CafePlaceListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        place.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cafeTableViewCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = place[indexPath.row]
        return cell 
    }
    
    
}
