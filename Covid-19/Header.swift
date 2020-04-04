//
//  Header.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var Result:GlobalCount? {
        didSet{
            guard let results = Result else {
                return
            }
       
         
            
            
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .decimal
            // localize to your grouping and decimal separator
            currencyFormatter.locale = Locale.current

            // We'll force unwrap with the !, if you've got defined data you may need more error checking
            numberDeath.text  = currencyFormatter.string(for: results.result?.deaths )
            NumberRecoverText.text = currencyFormatter.string(for: results.result?.recovered )
            NumberDeathText.text  = currencyFormatter.string(for: results.result?.confirmed )
             
            
        }
    }
    var numberOfCountry:Int? {
        didSet{
            guard let results = numberOfCountry else {
                return
            }
       
         
            
            numbreOFCountries.text = "\(results) countries/regions"
         
             
            
        }
    }
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    
    
    let rootStuckView: UIStackView = {
        let iv = UIStackView()
        iv.distribution = .fill
        iv.spacing = 5
        iv.alignment = .fill
        iv.axis = .vertical
        return iv
    }()
    
    
    
    let lefRightStuck: UIStackView = {
        let iv = UIStackView()
        iv.axis = .horizontal
        iv.distribution = .fillEqually
        iv.alignment = .fill
        iv.spacing = 5
        return iv
    }()
    
    
    
    
    let topView: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    let leftView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .SecondeColor
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    let reightTop: UIView = {
        let iv = UIView()
       iv.backgroundColor = .SecondeColor
            iv.layer.cornerRadius = 5
           return iv
    }()
    let reightBottom: UIView = {
        let iv = UIView()
    iv.backgroundColor = .SecondeColor
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    let reight: UIStackView = {
        let iv = UIStackView()
        iv.axis = .vertical
        iv.distribution = .fillEqually
        iv.spacing = 5
        iv.alignment = .fill
        return iv
    }()
    
    
    
    let boutomview: UIView = {
        let iv = UIView()
        iv.backgroundColor = .SecondeColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    
    
    // number of Death
    
    
    
    let NumberDeathText: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = .redColor
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let totlalabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        label.text = "Total Confirmed"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    let numbreOFCountries: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textAlignment = .right
 
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    let rootLeftnumberStack: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .vertical
        sv.spacing = 5
        sv.alignment = .center
        sv.distribution = .fillProportionally
        
        return sv
    }()
    
    
    
    // number of Recovers
    
    
    
    let NumberRecoverText: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        label.textColor = .greenColor
        label.numberOfLines = 0
        return label
    }()
    
    let Recoveredlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        label.text = "Total Recovered"
       
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .darkGray
        
        return label
    }()
 
    
    let RecoverednumberStack: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .vertical
        sv.spacing = 5
        sv.alignment = .center
        sv.distribution = .fillProportionally
        
        return sv
    }()
    
    
       
       // number of Death
       
       
       
    
       let numberDeath: UILabel = {
        
           let label = UILabel()
           
           label.text = "0"
           label.font = UIFont.systemFont(ofSize: 27, weight: .bold)
           label.textColor = .DeathColor
           label.numberOfLines = 0
           return label
       }()
       
       let Deathlabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           
           label.text = "Total Deaths"
           label.font = UIFont.systemFont(ofSize: 15, weight: .light)
           label.textColor = .darkGray
           
           return label
       }()
    
       
       let DeathnumberStack: UIStackView = {
           let sv = UIStackView()
           sv.axis  = .vertical
           
           sv.alignment = .center
           sv.distribution = .fillProportionally
        sv.spacing = 3
           return sv
       }()
       
       // info Label
    
      let infolabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           
           label.text = "Data sources: This app builds upon the dataset of John Hopkins UniversityData sources: WHO, CDC, ECDC, NHC, DXY,"
           label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
           label.numberOfLines = 0
        label.textColor = .darkGray
           return label
       }()
    
    
    
    
       
       // Get More Information
       
       
       
    
       let MoreInformation: UILabel = {
        
           let label = UILabel()
           
           label.text = "Aide et information"
           label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
           label.textColor = .white
           label.numberOfLines = 0
           return label
       }()
       
       let urlInformation: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           
           label.text = "who.int/fr/news-room/q-a-detail"
           label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
           label.textColor = .darkGray
            label.numberOfLines = 0
           
           return label
       }()
    
       
       let rootMoreInformation : UIStackView = {
           let sv = UIStackView()
           sv.axis  = .vertical
        sv.spacing = 4
           sv.alignment = .leading
           sv.distribution = .fillProportionally
           
           return sv
       }()
       
    
       let GoToUrl : UIButton = {
           let sv = UIButton()
        sv.setImage(#imageLiteral(resourceName: "goButton"), for: .normal)
          
           return sv
       }()
       
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        addSubview(rootStuckView)
        rootStuckView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .zero)
        rootStuckView.addArrangedSubview(topView)
      
        topView.addSubview(infolabel)
        infolabel.anchor(top: topView.topAnchor, leading: topView.leadingAnchor, bottom: topView.bottomAnchor, trailing: topView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .zero)
        
        rootStuckView.addArrangedSubview(lefRightStuck)
        
        lefRightStuck.addArrangedSubview(leftView)
        
        leftView.addSubview(rootLeftnumberStack)
        rootLeftnumberStack.translatesAutoresizingMaskIntoConstraints = false
        rootLeftnumberStack.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        rootLeftnumberStack.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        rootLeftnumberStack.anchor(top: nil, leading: leftView.leadingAnchor, bottom: nil, trailing: leftView.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .zero)
        
        rootLeftnumberStack.addArrangedSubview(NumberDeathText)
        rootLeftnumberStack.addArrangedSubview(totlalabel)
        rootLeftnumberStack.addArrangedSubview(numbreOFCountries)
        
        
        
        
        
        
        
        lefRightStuck.addArrangedSubview(reight)
        
        reight.addArrangedSubview(reightTop)
        reightTop.addSubview(RecoverednumberStack)
        RecoverednumberStack.centerYAnchor.constraint(equalTo: reightTop.centerYAnchor).isActive = true
        RecoverednumberStack.centerXAnchor.constraint(equalTo: reightTop.centerXAnchor).isActive = true
        RecoverednumberStack.anchor(top: nil, leading: reightTop.leadingAnchor, bottom: nil, trailing: reightTop.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .zero)
        RecoverednumberStack.addArrangedSubview(NumberRecoverText)
        RecoverednumberStack.addArrangedSubview(Recoveredlabel)
        
        reight.addArrangedSubview(reightBottom)
        
      
            reightBottom.addSubview(DeathnumberStack)
        DeathnumberStack.centerYAnchor.constraint(equalTo: reightBottom.centerYAnchor).isActive = true
         DeathnumberStack.centerXAnchor.constraint(equalTo: reightBottom.centerXAnchor).isActive = true
            DeathnumberStack.anchor(top: nil, leading: reightBottom.leadingAnchor, bottom: nil, trailing: reightBottom.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .zero)
            DeathnumberStack.addArrangedSubview(numberDeath)
            DeathnumberStack.addArrangedSubview(Deathlabel)
        
        
        
        
        
        
        
        
        rootStuckView.addArrangedSubview(boutomview)
        boutomview.addSubview(rootMoreInformation)
        
         rootMoreInformation.centerYAnchor.constraint(equalTo: boutomview.centerYAnchor).isActive = true
        rootMoreInformation.anchor(top: boutomview.topAnchor, leading: boutomview.leadingAnchor, bottom: boutomview.bottomAnchor, trailing: boutomview.trailingAnchor, padding: .init(top: 16, left: 10, bottom: 16, right: 10), size: .zero)
        rootMoreInformation.addArrangedSubview(MoreInformation)
        rootMoreInformation.addArrangedSubview(urlInformation)
       // boutomview.heightAnchor.constraint(equalTo: topView.heightAnchor).isActive = true
        
        boutomview.addSubview(GoToUrl)
        GoToUrl.translatesAutoresizingMaskIntoConstraints = false
        GoToUrl.centerYAnchor.constraint(equalTo: boutomview.centerYAnchor).isActive = true
        GoToUrl.trailingAnchor.constraint(equalTo: boutomview.trailingAnchor, constant: -15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
