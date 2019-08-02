//
//  EventListCell.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import UIKit

class EventListCell: UITableViewCell {
    
    @IBOutlet weak var eventView: UIView! {
        didSet {
            eventView.layer.shadowOpacity = 0.7
            eventView.layer.shadowColor = UIColor.gray.cgColor
            eventView.layer.shadowOffset = .zero
            eventView.layer.shadowRadius = 8
            eventView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateView: UIView! {
        didSet {
            dateView.layer.cornerRadius = 8
            dateView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var priceView: UIView! {
        didSet {
            priceView.layer.cornerRadius = 15
            priceView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
}

