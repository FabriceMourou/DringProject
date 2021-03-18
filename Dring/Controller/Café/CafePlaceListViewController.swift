import UIKit

class CafePlaceListViewController: UIViewController {
    
    
    @IBOutlet weak var cafeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

 
 
    
}

extension CafePlaceListViewController: UITableViewDelegate {
    
}

extension CafePlaceListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeTableViewCell") as! CafeTableViewCell
        
        return cell 
    }
    
    
}
