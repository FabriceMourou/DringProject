

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private let travelTableView: UITableView = {
        let travelTable = UITableView()
        
        travelTable.register(SimpleTravelTableViewCell.self, forCellReuseIdentifier: SimpleTravelTableViewCell.identifier)
        
        travelTable.register(ImageTravelTableViewCell.nib(), forCellReuseIdentifier: ImageTravelTableViewCell.identifier)
        
        travelTable.register(MultipleTableViewCell.self, forCellReuseIdentifier: MultipleTableViewCell.identifier)
        
        return travelTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Travel"
        view.addSubview(travelTableView)
        travelTableView.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.7648648073, green: 0.9065358285, blue: 1, alpha: 1))
        travelTableView.separatorStyle = .none
        travelTableView.delegate = self
        travelTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        travelTableView.frame = view.bounds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 1 {
            let simpleTravelTableViewCell = tableView.dequeueReusableCell(withIdentifier: SimpleTravelTableViewCell.identifier, for: indexPath)
            
            simpleTravelTableViewCell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.7648648073, green: 0.9065358285, blue: 1, alpha: 1))
            simpleTravelTableViewCell.textLabel?.text = "Ma sortie"
            simpleTravelTableViewCell.textLabel?.textColor =  UIColor .black
            simpleTravelTableViewCell.textLabel?.font = UIFont.init(name: "Menlo", size: 20)
            simpleTravelTableViewCell.textLabel?.textAlignment = .center
            
            return simpleTravelTableViewCell
            
            
        }
        if indexPath.row < 2 {
            let imageTravelTableViewCell = tableView.dequeueReusableCell(withIdentifier: ImageTravelTableViewCell.identifier, for: indexPath) as! ImageTravelTableViewCell
            
            imageTravelTableViewCell.configure(with: "IM5")
            
            imageTravelTableViewCell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.7648648073, green: 0.9065358285, blue: 1, alpha: 1))
            
            
            
            return imageTravelTableViewCell
            
        }
        
        
        let multipleTableViewCell = tableView.dequeueReusableCell(withIdentifier: MultipleTableViewCell.identifier, for: indexPath) as! MultipleTableViewCell
        multipleTableViewCell.configure()
        multipleTableViewCell.backgroundColor = UIColor.init(cgColor: #colorLiteral(red: 0.7648648073, green: 0.9065358285, blue: 1, alpha: 1))
        return multipleTableViewCell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 1 {
            return 20
        } else if indexPath.row < 2{
            return 200
        } else {
            return 100
        }
        
       
        
    }
    
    
}
