//
//  EventListViewController.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import UIKit
import Kingfisher

class EventListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var eventViewModel: EventViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEventList()
    }


}

extension EventListViewController {
    
    private func loadEventList() {
        self.eventViewModel?.fetchEvents { isLoaded in
            if isLoaded {
                self.tableView.reloadData()
            }
            else {
                Util.alertMessage(controller: self, message: "Ops, deu algo errado.", title: "")
            }
        }
    }
}

extension EventListViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection _: Int) -> Int {
        return eventViewModel?.eventList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventListCell", for: indexPath) as! EventListCell
        
        cell.title.text = eventViewModel?.eventList[indexPath.row].title
        
        if let price = eventViewModel?.eventList[indexPath.row].price, price > 0 {
            let formattedPrice = String(format: "%.2f",
                                        locale: Locale(identifier: "pt_BR"),
                                        price)
            
            cell.priceLabel.text = "R$ " + formattedPrice
        }
        else {
            cell.priceLabel.text = "GRÁTIS"
        }
        
        let url = URL(string: (eventViewModel?.eventList[indexPath.row].image)!)
        cell.backgroundImage.kf.setImage(with: url, placeholder: UIImage(named: "default_background"))
        
        let dayFormatter = DateFormatter(dateFormat: "dd")
        let monthFormatter = DateFormatter(dateFormat: "MMM")
        let yearFormatter = DateFormatter(dateFormat: "yyyy")
        
        let date: Date = eventViewModel?.eventList[indexPath.row].date ?? Date()
        cell.dayLabel.text = dayFormatter.string(from: date)
        cell.monthLabel.text = monthFormatter.string(from: date).uppercased()
        cell.yearLabel.text = yearFormatter.string(from: date)
        
        cell.eventView.layer.shadowPath = UIBezierPath(rect: cell.eventView.bounds).cgPath
        cell.eventView.layer.shadowRadius = 1.0
        cell.eventView.layer.shadowOffset = .zero
        cell.eventView.layer.shadowColor = UIColor.gray.cgColor
        cell.eventView.layer.shadowOpacity = 1
        
        return cell
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 400.0
    }
}

extension EventListViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let event = eventViewModel?.eventList[indexPath.row] {
            eventViewModel?.currentEvent = event
            self.performSegue(withIdentifier: "segueToDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail" {
            if let eventVC = segue.destination as? EventDetailViewController {
                eventVC.event = eventViewModel?.currentEvent
            }
        }
    }
    
}

