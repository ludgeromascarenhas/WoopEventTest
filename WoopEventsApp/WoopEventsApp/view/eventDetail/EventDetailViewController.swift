//
//  EventDetailViewController.swift
//  WoopEventsApp
//
//  Created by Ludgero Gil Mascarenhas on 01/08/19.
//  Copyright © 2019 Ludgero Gil Mascarenhas. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var personView: UIView! {
        didSet {
            personView.setShadow()
            let tapPeople = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            personView.addGestureRecognizer(tapPeople)
            contentView.addSubview(personView)
        }
    }
    @IBOutlet weak var personLabel: UILabel!{
        didSet {
            personLabel.text = "\(0)"
        }
    }
    @IBOutlet weak var cuponsView: UIView! {
        didSet {
            cuponsView.setShadow()
            let tapCupons = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            cuponsView.addGestureRecognizer(tapCupons)
            contentView.addSubview(cuponsView)
        }
    }
    @IBOutlet weak var cuponsNumber: UILabel! {
        didSet {
            cuponsNumber.text = "\(0)"
        }
    }
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceView: UIView! {
        didSet {
            priceView.layer.cornerRadius = 15
            priceView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var checkinButton: UIButton! {
        didSet {
            checkinButton.addTarget(self, action: #selector(checkinButtonTapped), for: .touchUpInside)
        }
    }
    @IBOutlet weak var shareButton: UIButton! {
        didSet {
            shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        }
    }
    
    var eventViewModel: EventViewModelProtocol?
    var event: EventModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
}

extension EventDetailViewController {
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        Util.alertMessage(controller: self, message: "Funionalidade ainda não implementada.", title: "")
    }
    
    
    func setupView() {
        
        titleLabel.text = event.title
        
        let url = URL(string: (event.image))
        backgroundImage.kf.setImage(with: url, placeholder: UIImage(named: "default_background"))
        
        if let price = event?.price, price > 0 {
            let formattedPrice = String(format: "%.2f",
                                        locale: Locale(identifier: "pt_BR"),
                                        price)
            priceLabel.text = "R$ " + formattedPrice
        }
        else {
            priceLabel.text = "GRÁTIS"
        }
        descriptionLabel.text = event?.description
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateLabel.text = dateFormatter.string(from: event?.date ?? Date())
        
        setupAddressLabel()
        
        personLabel.text = "\(event.people.count)"
        cuponsNumber.text = "\(event.cupons.count)"
        
        
    }
    
    func setupAddressLabel() {
        let location = CLLocation(latitude: event.latitude, longitude: event.longitude)
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, _ in
            guard let placemark = placemarks?.first,
                let address = placemark.name,
                let city = placemark.locality else { return }
            
            self?.addressLabel.text = address + " - " + city
        }
    }
    
    @objc func checkinButtonTapped() {
        
        eventViewModel?.sendCheckin() { didCheckin in
            if didCheckin {
                print("foi enviado o checkin")
                Util.alertMessage(controller: self, message: "Check-in realizado com sucesso.", title: "")
                self.checkinButton.isEnabled = false
                self.checkinButton.alpha = 0.5
            }
            else {
                Util.alertMessage(controller: self, message: "Ops, deu algo errado no seu check-in. Tente mais tarde.", title: "")
                self.checkinButton.isEnabled = true
                self.checkinButton.alpha = 1
            }
        }
    }
    
    @objc func shareButtonTapped() {
        let titleEventShare = "Olhe este evento: " + event.title
        let objcToShare: [Any] = [titleEventShare]
        
        let activityViewController = UIActivityViewController(activityItems: objcToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
