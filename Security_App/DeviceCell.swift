//
//  DeviceCell.swift
//  Security_App
//
//  Created by Ryan Kibet on 21/03/2026.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var iconContainer: UIView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceTypeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastActiveLabel: UILabel!
    @IBOutlet weak var chevronLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = UIColor(named: "SurfaceColor")
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        iconContainer.layer.cornerRadius = 8
        iconContainer.backgroundColor = UIColor(named: "AccentGreen")?.withAlphaComponent(0.15)
    }
    
    func configure(name: String, type: String, status: String, lastActive: String) {
        deviceNameLabel.text = name
        deviceTypeLabel.text = type
        statusLabel.text = "● \(status)"
        lastActiveLabel.text = lastActive
        
        if status == "Online" {
            statusLabel.textColor = UIColor(named: "AccentGreen")
            iconContainer.backgroundColor = UIColor(named: "AccentGreen")?.withAlphaComponent(0.15)
        } else {
            statusLabel.textColor = UIColor(named: "TextSecondary")
            iconContainer.backgroundColor = UIColor(named: "TextSecondary")?.withAlphaComponent(0.15)
        }
    }
}
