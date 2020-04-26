//
//  CountryDataCollectionViewCell.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
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
            countryName.text = results.country?.uppercased()
            Countreycount.text = currencyFormatter.string(for: results.totalConfirmed )! + " • ↑+" +  currencyFormatter.string(for: results.newConfirmed )!
            Reoverdlabel.text = currencyFormatter.string(for: results.totalRecovered )
            deathLabel.text = currencyFormatter.string(for: results.totalDeaths )
            
        }
    }
    let countryName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
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
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    
    
    
    let Reoverdlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .greenColor
        label.textAlignment = .right
        //   label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    let deathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .DeathColor
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    
    
    
    
    
    
    
    let CountStuck: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .vertical
        sv.alignment = .trailing
        sv.distribution = .fillEqually
        sv.spacing = 0
        return sv
    }()
    
    
    
    let stuckInfo: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .horizontal
        
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.spacing = 10
        
        return sv
    }()
    
    
    
    let NamenumberOFCases: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .vertical
        
        sv.alignment = .leading
        sv.distribution = .fill
        sv.spacing = 5
        
        return sv
    }()
    
    let chartCountStuck: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .horizontal
        
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 5
        
        return sv
    }()
    
    
    
    
    
    let chartView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .red
        
        return sv
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //    backgroundColor = .SecondeColor
        layer.cornerRadius = 5
        
        stuckInfo.addArrangedSubview(NamenumberOFCases)
        NamenumberOFCases.addArrangedSubview(countryName)
        NamenumberOFCases.addArrangedSubview(Countreycount)
        
        
        
        stuckInfo.addArrangedSubview(chartCountStuck)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        chartCountStuck.addArrangedSubview(CountStuck)
        
        CountStuck.addArrangedSubview(deathLabel)
        CountStuck.addArrangedSubview(Reoverdlabel)
        
        Reoverdlabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        deathLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        Countreycount.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        addSubview(stuckInfo)
        stuckInfo.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 5, left: 10  , bottom: 10, right: 5), size: .zero)
        stuckInfo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
