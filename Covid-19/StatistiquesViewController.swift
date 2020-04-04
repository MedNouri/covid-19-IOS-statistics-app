 
 
 
 
import UIKit

private let refreshViewHeight:CGFloat = 200
fileprivate let cellId = "cellId"
fileprivate let headerId = "headerId"


class StatistiquesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    

    fileprivate let padding: CGFloat = 8

 
    var refreshView:RefreshView!
    
    var GlobalInformation : GlobalCount?
    var DataSourceTbael: CountryCount?
 
    let backButton : UIBarButtonItem = {
    let button = UIBarButtonItem()
    
    return button
    }()
    
    
    
    
    
    let rootStuckInfo : UIStackView = {
    let  stackNavBar =  UIStackView()
         stackNavBar.alignment = .leading
         stackNavBar.axis = .vertical
         stackNavBar.spacing = 0
         stackNavBar.distribution = .fillProportionally
    return stackNavBar
    }()
    
    
    
    
    
    let navBarTitleLabel : UILabel = {
        
        let label = UILabel()
        label.text = "COVID -19"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
        
        
        
    }()
    
    
    
    let navBarDateLabe : UILabel = {
        
        let label = UILabel()
        label.text = "  "
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
        
        
        
    }()
    
     
    
    
     let RefreshButton : UIBarButtonItem = {
     let button = UIBarButtonItem()
     button.image = #imageLiteral(resourceName: "refrechIcon")
     return button
     }()
     
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupCollectionView()
        refreshView = RefreshView(frame: CGRect(x:0, y:-refreshViewHeight, width:view.bounds.width, height: refreshViewHeight), scrollView: collectionView)
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.insertSubview(refreshView, at: 0)
        refreshView.delegate = self
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        rootStuckInfo.addArrangedSubview(navBarTitleLabel)
        rootStuckInfo.addArrangedSubview(navBarDateLabe)
        backButton.customView =  rootStuckInfo
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        RefreshButton.target = self
        RefreshButton.action = #selector(refrechThePage)
        self.navigationItem.rightBarButtonItem = RefreshButton
        definesPresentationContext = true
        GetGloabalNUmber()
        GetTableDat()
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshView.scrollViewDidScroll(scrollView)
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        refreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    @objc func  refrechThePage(){
        
    
        GetGloabalNUmber()
        GetTableDat()
        //refresher.endRefreshing()
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
             layout.sectionInset = .init(top: 0, left: padding, bottom: 0, right: padding)
            layout.sectionInsetReference = .fromSafeArea
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .automatic
        
        collectionView.register(CountryDataCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        header.Result = GlobalInformation
     header.numberOfCountry = DataSourceTbael?.countries.count
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        navBarDateLabe.text = DataSourceTbael?.date 
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 320)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSourceTbael?.countries.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CountryDataCollectionViewCell
        cell.result = DataSourceTbael?.countries[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(DetailsCountryViewController(), animated: true, completion: nil)
    }
    
}


 


func delayBySeconds(_ seconds: Double, delayedCode: @escaping ()->()) {
  let targetTime = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)
  print(targetTime)
  DispatchQueue.main.asyncAfter(deadline: targetTime) {
    delayedCode()
  }
}



extension StatistiquesViewController: RefreshViewDelegate {
  func refreshViewDidRefresh(refreshView: RefreshView) {
    delayBySeconds(3.0) {
      self.refreshView.endRefreshing()
    }
  }
}

