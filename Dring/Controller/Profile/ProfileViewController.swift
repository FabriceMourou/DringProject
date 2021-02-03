import UIKit

class ProfileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profil"
        customiseProfile()
        profileTableView.separatorStyle = .none
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        profileCollectionView.collectionViewLayout = layout
        
        profileCollectionView.register(ProfileCollectionViewCell.nib(), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
    }
    
   
    
    @IBOutlet weak var profilImage: UIImageView!
    @IBOutlet weak var aliasLabel: UILabel!
    @IBOutlet weak var profileStackView: UIStackView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileCollectionView: UICollectionView!
  
    
    private func customiseProfile () {
        profilImage.layer.cornerRadius = 50
        profilImage.layer.borderWidth = 1
        profilImage.layer.borderColor = UIColor.yellow.cgColor
        
   
    }
    
    var rideImages = [
        "IM2",
        "IM3",
        "IM4",
        "IM5"
    ]
    
  
    
    
   // MARK: - TableView
    
    
    
    var shopsData = [
        ExpandableNames(isExpanded: false, names: ["Chez Marcel", "Babylon", "Le Balto", "Serré"]),
        ExpandableNames(isExpanded: false, names: ["Croute", "Mie", "Levure", "Farine"]),
        ExpandableNames(isExpanded: false, names: ["Dédé", "Freines!", "Chaine", "Wheels"]),
        ExpandableNames(isExpanded: false, names: ["Chez Sauce", "Bab", "Basquette", "Fries"])
    ]
    
    var shopNames = [
        "Cafés",
        "Boulangeries",
        "Bouclards",
        "Restaurants"
        ]

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = .init(cgColor: #colorLiteral(red: 0.8898737981, green: 0.8220547665, blue: 0.7095000613, alpha: 1))
        view.layer.cornerRadius = 10
        
       
        
        let label = UILabel()
        label.textColor = .init(cgColor: #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1))
        label.text = "Vos \(shopNames[section])"
        label.font = UIFont.init(name: "Menlo", size: 13)
        label.frame = CGRect(x: 15, y: 5, width: 250, height: 30)
        view.addSubview(label)
        
        
        
        
        let button = UIButton(type: .system)
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.init(cgColor: #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Menlo", size: 10)
        button.frame = CGRect(x: 300, y: 5, width: 50, height: 30)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        view.addSubview(button)
        
        return view

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemOrange
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        5
    }
    
   
    
    @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        for row in shopsData[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
            
        }
        
        let isExpanded = shopsData[section].isExpanded
        shopsData[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
        if isExpanded {
            profileTableView.deleteRows(at: indexPaths, with: .fade)
            
        } else {
            profileTableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !shopsData[section].isExpanded {
            return 0
        }
        
        return shopsData[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath)
        
        let place = shopsData[indexPath.section].names[indexPath.row]
        
        profileTableViewCell.textLabel?.text = place
        profileTableViewCell.textLabel?.textColor = UIColor .white
        profileTableViewCell.textLabel?.font = UIFont.init(name: "Menlo", size: 15)
        profileTableViewCell.backgroundColor = UIColor.systemOrange

        return profileTableViewCell
    }
    
    
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



// MARK: -CollectionView




extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    
        performSegue(withIdentifier: "AlbumSegue", sender: nil)

    }
        
    
    
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rideImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        
        let cellIndex = indexPath.row
        let rideImageName = rideImages[cellIndex]
       
        
        cell.configure(with: rideImageName)
      
        return cell
    }
    
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}


