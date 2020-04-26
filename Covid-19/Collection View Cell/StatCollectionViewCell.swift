//
//  Chart.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 12/04/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import UIKit

class StatCollectionViewCell: UICollectionViewCell {
    
    
    
    var  statObject:StatObject?{
        
        
        didSet{
            
            
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .decimal
            // localize to your grouping and decimal separator
            currencyFormatter.locale = Locale.current
            numberConfirmed.text = currencyFormatter.string(for:statObject?.value ) 
            numberConfirmed.textColor = statObject?.color
            totlalabel.text = statObject?.title
            
            
        }
        
    }
    
    
    
    
    let numberConfirmed: UILabel = {
        let label = UILabel()
        
        label.text = "50000"
        label.font = UIFont.systemFont(ofSize: textSize, weight: .bold)
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
    
    
    
    let rootLeftnumberStack: UIStackView = {
        let sv = UIStackView()
        sv.axis  = .vertical
        sv.spacing = 5
        sv.alignment = .center
        sv.distribution = .fillProportionally
        
        return sv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        addSubview(rootLeftnumberStack)
        
        rootLeftnumberStack.translatesAutoresizingMaskIntoConstraints = false
        rootLeftnumberStack.centerYAnchor.constraint(equalTo:  centerYAnchor).isActive = true
        rootLeftnumberStack.centerXAnchor.constraint(equalTo:  centerXAnchor).isActive = true
        rootLeftnumberStack.anchor(top: nil, leading:  leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 2, left: 2, bottom: 2, right: 2), size: .zero)
        
        rootLeftnumberStack.addArrangedSubview(numberConfirmed)
        rootLeftnumberStack.addArrangedSubview(totlalabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
