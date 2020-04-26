//
//  DetailsCountryViewController.swift
 
//  Covid-19
//
//  Created by Mohamed Nouri on 12/04/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import UIKit


struct StatObject {
    var value:Int
    var title:String
    var color:UIColor
    
    
}

class DetailsCountryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var dataArray = [StatObject]()
    
    
    private func estimateFrameForText(text: String) -> CGFloat {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        
        
        
        var rect: CGRect = label.frame //get frame of label
        rect.size = (label.text?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: label.font.fontName , size: label.font.pointSize)!]))! //Calculate as per label font
        return rect.width // set width to Constraint outlet
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCell", for: indexPath) as! StatCollectionViewCell
        
        cell.statObject = dataArray[indexPath.row]
        
        
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
       
        currencyFormatter.locale = Locale.current
 
        return .init(width:  130, height:70)
    }
    
    
    
    
    var countrSlug:Country?
    
    var satuts:[StatArray] = []
    let CasesChart = Chart()
    
    
    
    
    
    let PreviewBackground : UIView = {
        
        let label = UIView()
        
        label.backgroundColor = .black
        
        return label
        
    }()
    
    let ActivitySearch : UIActivityIndicatorView = {
        
        let activitySearch = UIActivityIndicatorView()
        activitySearch.hidesWhenStopped = true
        activitySearch.color = .white
        
        return activitySearch
        
        
        
    }()
    
    let CountryName: UILabel = {
        let label = UILabel()
        
        label.text = "Usa"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    
    
    let Line: UIView = {
        let label = UIView()
        
        label.backgroundColor = .gray
        
        return label
    }()
    
    
    let Line2: UIView = {
        let label = UIView()
        
        label.backgroundColor = .gray
        
        return label
    }()
    
    
    let Line3: UIView = {
        let label = UIView()
        
        label.backgroundColor = .gray
        
        return label
    }()
    
    
    
    
    
    
    let rootStuckView: UIStackView = {
        let iv = UIStackView()
        iv.distribution = .fill
        iv.spacing = 15
        iv.alignment = .fill
        iv.axis = .vertical
        return iv
    }()
    
    
    
    
    
    
    
    
    // number of Death
    
    
    let newInformationStuck : UIStackView = {
        let sv = UIStackView()
        sv.axis  = .horizontal
        sv.spacing = 4
      
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    
    
    let NewCasesbackground: UIView = {
        let iv = UIView()
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    
    
    let NewNumberConfirmed: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.textColor = .redColor
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    let Newtotlalabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        
        label.text = "New Confirmed"
        
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        
        return label
    }()
    
    
    let NewrootLeftnumberStack: UIStackView = {
        let sv = UIStackView()
            sv.axis  = .vertical
            sv.spacing = 5
            sv.alignment = .center
            sv.distribution = .fillProportionally
            
        
        return sv
    }()
    
    
    
    let NewDeathnumberStack: UIStackView = {
        let sv = UIStackView()
              sv.axis  = .vertical
            sv.spacing = 5
            sv.alignment = .center
            sv.distribution = .fillProportionally
            
        return sv
    }()
    
    let NewRecoverednumberStack: UIStackView = {
        let sv = UIStackView()
           sv.axis  = .vertical
                 sv.spacing = 5
                 sv.alignment = .center
                 sv.distribution = .fillProportionally
                 
        
        return sv
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let NewDeathbackground: UIView = {
        let iv = UIView()
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    
    
    
    
    
    
    
    
    
    // number of Death
    
    
    
    
    let NewnumberDeath: UILabel = {
        
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .DeathColor
        label.numberOfLines = 0
             label.textAlignment = .center
        return label
    }()
    
    let NewDeathlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        label.text = "New Deaths"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        
        return label
    }()
    

    
    
    
    let NewRevoverdbackground: UIView = {
        let iv = UIView()
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    
    
    
    let NewNumberRecoverText: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.textColor = .greenColor
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let NewRecoveredlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        label.text = "New Recovered"
        
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        
        return label
    }()
    
    

    
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var contentView: UIView = {
        let v = UIView()
        
        return v
    }()
    
    
    
    
    let BigNumberConfirmed: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: textSize, weight: .bold)
        label.textColor = .redColor
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    
    var collectionview :UICollectionView!
    
    
    let ExitButton: UIButton = {
        let sv = UIButton()
        sv.setImage(#imageLiteral(resourceName: "exitButton"), for: .normal)
        
        return sv
    }()
    
    
    let titleChartCOnfiremed: UILabel = {
        let label = UILabel()
        
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    let titleChartDeath: UILabel = {
           let label = UILabel()
           
           label.text = " "
           label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
           label.textColor = .white
           label.numberOfLines = 1
           label.textAlignment = .center
           return label
       }()
    let titleChartReoverd: UILabel = {
           let label = UILabel()
           
           label.text = " "
           label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
           label.textColor = .white
           label.numberOfLines = 1
           label.textAlignment = .center
           return label
       }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExitButton.addTarget(self, action: #selector(dismissF), for: .touchUpInside)
        view.addSubview(PreviewBackground)
        PreviewBackground.translatesAutoresizingMaskIntoConstraints = false
        PreviewBackground.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        PreviewBackground.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        PreviewBackground.backgroundColor = .black
        
        
        view.backgroundColor = .SecondeColor
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 2, left: 2, bottom: 2, right: 2)
        flowLayout.sectionInsetReference = .fromSafeArea
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionview.register(StatCollectionViewCell.self, forCellWithReuseIdentifier: "StatCell")
        collectionview.delegate = self
        collectionview.dataSource = self
        
        
        setupScrollView()
        setupViews()
        
        
        PreviewBackground.addSubview(collectionview )
        collectionview.anchor(top: PreviewBackground.safeAreaLayoutGuide.topAnchor, leading: PreviewBackground.safeAreaLayoutGuide.leadingAnchor, bottom: PreviewBackground.safeAreaLayoutGuide.bottomAnchor, trailing: PreviewBackground.safeAreaLayoutGuide.trailingAnchor)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.contentInset.right = 20
        
        
        
      
  
        
        
        
        guard let country =  countrSlug else {
            return
        }
        
        
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        dataArray.append(contentsOf: [.init(value: country.totalConfirmed, title: "Total Confirmed", color: UIColor.redColor ?? .red)
            ,.init(value: country.totalRecovered, title: "Total Recovered", color: UIColor.greenColor ?? .green),
             .init(value: country.totalDeaths, title: "Total Death", color: UIColor.DeathColor ?? .red)
            
        ])
        collectionview.reloadData()
        
        
        CountryName.text = country.country
        
        BigNumberConfirmed.text = currencyFormatter.string(for: country.totalConfirmed)
        if let newRecoverd = currencyFormatter.string(for: country.totalRecovered){
            
            NewNumberRecoverText.text =  "↑+" + newRecoverd
        }
        
        
        if let newDeath = currencyFormatter.string(for: country.totalDeaths){
            NewnumberDeath.text = "↑+" + newDeath
            
        }
        
        
        if let newNumberConfirmed = currencyFormatter.string(for: country.newConfirmed) {
            NewNumberConfirmed.text = "↑+" + newNumberConfirmed
            
        }
        
         self.ActivitySearch.startAnimating()
        
        var request = URLRequest(url: URL(string: "https://api.covid19api.com/total/dayone/country/\(country.slug ?? "")")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            DispatchQueue.main.async {
        self.ActivitySearch.stopAnimating()
            }
            print(data)
            
            do {
                let res = try JSONDecoder().decode([StatArray].self, from: data)
                
                
                
                
                self.satuts = res
                
                DispatchQueue.main.async {
                    
                    self.initializeChart()
                    
                    
                }
                
            } catch let error {
                print(error)
            }
            
            
        }
        
        task.resume()
        
        
        
        
        
        
        
    }
    
    
    
    
    
    @objc func dismissF(){
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: PreviewBackground.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: 700).isActive = true
    }
    
    func setupViews(){
        contentView.addSubview(rootStuckView)
        
        
        contentView.addSubview(ExitButton)
        ExitButton.anchor(top: contentView.topAnchor, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top:6, left: 0, bottom: 0, right: 16), size: .init(width: 25, height: 25))
        rootStuckView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 20 ,left: 16, bottom: 0, right:16), size: .zero)
        
        
        rootStuckView.addArrangedSubview(CountryName)
        rootStuckView.addArrangedSubview(Line)
        Line.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        Line.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        rootStuckView.addArrangedSubview(newInformationStuck)
        newInformationStuck.addArrangedSubview(NewCasesbackground)
        
        NewCasesbackground.addSubview(NewrootLeftnumberStack)
             NewrootLeftnumberStack.translatesAutoresizingMaskIntoConstraints = false
           newInformationStuck.heightAnchor.constraint(equalToConstant: 60).isActive = true
        NewCasesbackground.translatesAutoresizingMaskIntoConstraints = false
     
   
        
        NewrootLeftnumberStack.addArrangedSubview(NewNumberConfirmed)
        NewrootLeftnumberStack.addArrangedSubview(Newtotlalabel)
        NewrootLeftnumberStack.centerYAnchor.constraint(equalTo: NewCasesbackground.centerYAnchor).isActive = true
        NewrootLeftnumberStack.centerXAnchor.constraint(equalTo: NewCasesbackground.centerXAnchor).isActive = true
        
//        NewrootLeftnumberStack.leadingAnchor.constraint(equalTo: NewCasesbackground.leadingAnchor, constant: 5).isActive = true
//
//        NewrootLeftnumberStack.leadingAnchor.constraint(equalTo: NewCasesbackground.trailingAnchor, constant: -5).isActive = true
        
        newInformationStuck.addArrangedSubview(NewDeathbackground)
        
        
        NewDeathbackground.addSubview(NewDeathnumberStack)
        NewDeathnumberStack.translatesAutoresizingMaskIntoConstraints = false
        NewDeathnumberStack.centerYAnchor.constraint(equalTo: NewDeathbackground.centerYAnchor).isActive = true
        NewDeathnumberStack.centerXAnchor.constraint(equalTo: NewDeathbackground.centerXAnchor).isActive = true
//        NewDeathnumberStack.leadingAnchor.constraint(equalTo: NewDeathbackground.leadingAnchor, constant: 5).isActive = true
//
//        NewDeathnumberStack.leadingAnchor.constraint(equalTo: NewDeathbackground.trailingAnchor, constant: -5).isActive = true
        NewDeathnumberStack.addArrangedSubview(NewnumberDeath)
        NewDeathnumberStack.addArrangedSubview(NewDeathlabel)
        
        
        
        
        //
        newInformationStuck.addArrangedSubview(NewRevoverdbackground)
        NewRevoverdbackground.addSubview(NewRecoverednumberStack)
        NewRecoverednumberStack.translatesAutoresizingMaskIntoConstraints = false
        NewRecoverednumberStack.centerYAnchor.constraint(equalTo: NewRevoverdbackground.centerYAnchor).isActive = true
        NewRecoverednumberStack.centerXAnchor.constraint(equalTo: NewRevoverdbackground.centerXAnchor).isActive = true
//        NewRecoverednumberStack.leadingAnchor.constraint(equalTo: NewRevoverdbackground.leadingAnchor, constant: 5).isActive = true
//
//        NewRecoverednumberStack.leadingAnchor.constraint(equalTo: NewRevoverdbackground.trailingAnchor, constant: -5).isActive = true
        
        NewRecoverednumberStack.addArrangedSubview(NewNumberRecoverText)
        NewRecoverednumberStack.addArrangedSubview(NewRecoveredlabel)
        
        
        
        rootStuckView.addArrangedSubview(Line2)
        Line2.translatesAutoresizingMaskIntoConstraints = false
        Line2.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
          
         rootStuckView.addArrangedSubview(titleChartCOnfiremed)
        rootStuckView.addArrangedSubview(CasesChart)
        CasesChart.translatesAutoresizingMaskIntoConstraints = false
        CasesChart.heightAnchor.constraint(equalToConstant: 260).isActive = true
           rootStuckView.addArrangedSubview(titleChartReoverd)
        
        
        contentView.addSubview(ActivitySearch)
          ActivitySearch.translatesAutoresizingMaskIntoConstraints = false
          ActivitySearch.centerXAnchor.constraint(equalTo: CasesChart.centerXAnchor).isActive = true
          ActivitySearch.centerYAnchor.constraint(equalTo: CasesChart.centerYAnchor).isActive = true
   
        
        rootStuckView.addArrangedSubview(titleChartDeath)
        
    }
    
    
    
    
    func initializeChart() {
        
        // Initialize data series and labels
        let stockValues = getStockValues()
        
        var serieData: [Double] = []
        var labels: [Double] = []
        var labelsAsString: Array<String> = []
        
        // Date formatter to retrieve the month names
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        
        for (i, value) in stockValues.enumerated() {
            
            serieData.append(value["confirmed"] as! Double)
            
            // Use only one label for each month
            let month = Int(dateFormatter.string(from: value["date"] as! Date))!
            let monthAsString:String = dateFormatter.monthSymbols[month - 1]
            
            if (labels.count == 0 || labelsAsString.last != monthAsString) {
                labels.append(Double(i))
                labelsAsString.append(monthAsString)
            }
        }
        
        let series = ChartSeries(serieData)
        series.area = true
        series.color = .red
        // Configure chart layout
        CasesChart.lineWidth = 0.6
        CasesChart.labelFont = UIFont.systemFont(ofSize: 10)
        CasesChart.xLabels = labels
        
        CasesChart.xLabelsFormatter = { (labelIndex: Int, labelValue: Double) -> String in
            return labelsAsString[labelIndex]
        }
        CasesChart.xLabelsTextAlignment = .center
        CasesChart.yLabelsOnRightSide = true
        //            // Add some padding above the x-axis
        CasesChart.minY = serieData.min()!
        CasesChart.xLabelsOrientation = .vertical
        CasesChart.add(series)
        
        
        
        
        
        
    }
 
    
    func getStockValues() -> Array<Dictionary<String, Any>> {
        
        
        var values:Array<Dictionary<String, Any>> = []
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
 
        for item in satuts {
            
            
            
            if  let date = dateFormatter.date(from: item.date){
            let close = Double(exactly: item.confirmed ?? 0)
            
            
                values.append(["date": date, "confirmed": close ?? 0])
            }else {
                continue
                
            }
        }
        
        
        return values
        
    }
    
    
}











struct StatArray: Codable {
    
    let province, city, cityCode, lat: String?
    let lon: String?
    let confirmed, deaths, recovered, active: Int?
    let date: String
    let cases :Int?
    enum CodingKeys: String, CodingKey {
        
        case province = "Province"
        case city = "City"
        case cityCode = "CityCode"
        case lat = "Lat"
        case lon = "Lon"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        case date = "Date"
        case cases = "Cases"
    }
}


