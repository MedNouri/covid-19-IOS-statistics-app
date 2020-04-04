//
//  CountryDataCollectionViewCell.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import UIKit

class CountryDataCollectionViewCell: UICollectionViewCell {
    
     var result:Country? {
         didSet{
             guard let results = result else {
                 return
             }
        
          
             
             
             let currencyFormatter = NumberFormatter()
             currencyFormatter.usesGroupingSeparator = true
             currencyFormatter.numberStyle = .decimal
             // localize to your grouping and decimal separator
             currencyFormatter.locale = Locale.current

             // We'll force unwrap with the !, if you've got defined data you may need more error checking
            countryName.text = results.country
             Countreycount.text = currencyFormatter.string(for: results.totalConfirmed )
               Reoverdlabel.text = currencyFormatter.string(for: results.totalRecovered )
            deathLabel.text = currencyFormatter.string(for: results.totalDeaths )
             
         }
     }
       let countryName: UILabel = {
           let label = UILabel()
           
           label.text = "USA"
           label.textColor = .white
           label.textAlignment = .left
           return label
       }()
       
    
    
    
    
       let Countreycount: UILabel = {
           let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "0"
        label.textColor = .redColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
              label.textAlignment = .right
           return label
       }()
         let Reoverdlabel: UILabel = {
              let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
              label.text = "0"
            label.textColor = .greenColor
                 label.textAlignment = .left
              return label
          }()
            let deathLabel: UILabel = {
                 let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false

                 label.text = "0"
              label.textColor = .DeathColor
                    label.textAlignment = .left
                 return label
             }()
    
    let CountStuck: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .horizontal
        
         sv.distribution = .equalCentering
         sv.spacing = 4
        return sv
    }()
    
    
       
       let stuckInfo: UIStackView = {
           let sv = UIStackView()
           sv.axis  = .horizontal
           
           sv.alignment = .fill
           sv.distribution = .equalSpacing
            sv.spacing = 10
        
           return sv
       }()
       
    override init(frame: CGRect) {
        super.init(frame: frame)
    //    backgroundColor = .SecondeColor
        layer.cornerRadius = 5
        stuckInfo.addArrangedSubview(countryName)
       
        CountStuck.addArrangedSubview(Reoverdlabel)
        CountStuck.addArrangedSubview(deathLabel)
         CountStuck.addArrangedSubview(Countreycount)
        
        Reoverdlabel.setContentCompressionResistancePriority(.required, for: .horizontal)
          deathLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
          Countreycount.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        
        stuckInfo.addArrangedSubview(CountStuck)
        
        addSubview(stuckInfo)
        stuckInfo.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 5, left: 10  , bottom: 10, right: 5), size: .zero)
        stuckInfo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    }
