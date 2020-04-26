 
 //
 //  StatistiquesViewController.swift
  
 //  Covid-19
 //
 //  Created by Mohamed Nouri on 12/04/2020.
 //  Copyright © 2020 Mohamed Nouri. All rights reserved.
 //
 
 
 import UIKit
 
 private let refreshViewHeight:CGFloat = 200
 fileprivate let cellId = "cellId"
 fileprivate let headerId = "headerId"
 fileprivate let padding: CGFloat = 8
 
 class StatistiquesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var filteredCountry: [Country] = []
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var refreshView:RefreshView!
    var DataSourceTbael: CountryCount?
    let backButton : UIBarButtonItem = {
        
        
        let button = UIBarButtonItem()
        return button
    }()
    
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
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
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
        
        
        
    }()
    
    
    
    let navBarDateLabe : UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        return label
        
        
        
    }()
    
    let ActivitySearch : UIActivityIndicatorView = {
        
        let activitySearch = UIActivityIndicatorView()
        activitySearch.hidesWhenStopped = true
        activitySearch.color = .white
        
        return activitySearch
        
        
        
    }()
    
    
    
    let RefreshButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = #imageLiteral(resourceName: "refrechIcon")
        return button
    }()
    
    
    
    let MapButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = #imageLiteral(resourceName: "ShowaMap")
        return button
    }()
    
    
    
    
    
    func currentQueueName() -> String? {
        let name = __dispatch_queue_get_label(nil)
        return String(cString: name, encoding: .utf8)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
        setupCollectionView()
        refreshView = RefreshView(frame: CGRect(x:0, y:-refreshViewHeight, width:view.bounds.width, height: refreshViewHeight), scrollView: collectionView)
        SetUpView()
        
        
        searchController.searchResultsUpdater = self
        
        
        
        GetTableDat { (result) in
            
            DispatchQueue.main.async {
                
                
                self.ActivitySearch.stopAnimating()
                
                guard let result = result else {
                    
                    return
                }
                self.collectionView.isHidden = false
                self.DataSourceTbael = result
                self.collectionView.reloadData()
                
            }
            
        }
        
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshView.scrollViewDidScroll(scrollView)
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        refreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
 
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: 0, left: padding, bottom: 0, right: padding)
            layout.sectionInsetReference = .fromSafeArea
        }
    }
    
    
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .automatic
        
        collectionView.register(CountryDataCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        
        if let DataSourceTbael = DataSourceTbael {
            header.Result = DataSourceTbael.global
            header.numberOfCountry = DataSourceTbael.countries.count
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM"
            
            let date: Date? = dateFormatterGet.date(from: DataSourceTbael.date )
            if let date = date{
                
                navBarTitleLabel.text =  dateFormatter.string(from: date)
                dateFormatter.dateFormat =  "HH:mm"
                navBarDateLabe.text = "Last Update : " + dateFormatter.string(from: date)
            }
            
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if isFiltering {
            return .init(width: 0, height: 0)
        }
        
        return .init(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredCountry.count
        }
        
        
        return DataSourceTbael?.countries.count ?? 0
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CountryDataCollectionViewCell
        if isFiltering {
            
            cell.result = filteredCountry[indexPath.row]
        } else {
            cell.result = DataSourceTbael?.countries[indexPath.row]
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let countryMoreInfo = DetailsCountryViewController()
        
        
        if isFiltering {
            countryMoreInfo.countrSlug = filteredCountry[indexPath.row]
        }else {
            
                 countryMoreInfo.countrSlug = DataSourceTbael?.countries[indexPath.row]
        }
        
   
        countryMoreInfo.modalPresentationStyle = .fullScreen
        present(countryMoreInfo, animated: true, completion: nil)
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
 
 
 
 
 extension StatistiquesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    
    func filterContentForSearchText(_ searchText: String) {
        
    
        let dataFiltred = DataSourceTbael?.countries.filter({ (country) -> Bool in
            (country.country?.localizedCaseInsensitiveContains(searchText.uppercased()) ?? false)  
        })
        
        
        filteredCountry = dataFiltred ?? []
        collectionView.reloadData()
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
 }
