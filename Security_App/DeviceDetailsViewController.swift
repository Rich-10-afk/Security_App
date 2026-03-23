import UIKit

class DeviceDetailsViewController: UIViewController {
    
    //
    @IBOutlet weak var heroCard: UIView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceTypeLabel: UILabel!
    @IBOutlet weak var statusBadge: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var removeButton: UIButton!
    
    // MARK:
    var device: Device?
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundPrimary")
        //setupUI()
        configureWithDevice()
    }
    
    //
    func setupUI() {
        // Hero card
        heroCard.layer.cornerRadius = 14
        heroCard.layer.borderWidth = 1
        heroCard.layer.borderColor = UIColor(named: "AccentGreen")?.withAlphaComponent(0.3).cgColor
        
        // Status badge
        statusBadge.layer.cornerRadius = 6
        statusBadge.layer.masksToBounds = true
        statusBadge.backgroundColor = UIColor(named: "AccentGreen")?.withAlphaComponent(0.15)
        
        // Toggle
        toggleSwitch.onTintColor = UIColor(named: "AccentGreen")
        
        // Remove button
        removeButton.layer.cornerRadius = 10
        removeButton.layer.borderWidth = 1
        removeButton.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.3).cgColor
        removeButton.setTitleColor(.systemRed, for: .normal)
    }
    
    //
    func configureWithDevice() {
        guard let device = device else { return }
        
        // Set navigation title
        title = device.name
        
        deviceNameLabel.text = device.name
        deviceTypeLabel.text = "\(device.type) · Last active \(device.lastActive)"
        statusBadge.text = "  \(device.status)  "
        toggleSwitch.isOn = device.isOnline
        
        if device.isOnline {
            statusBadge.textColor = UIColor(named: "AccentGreen")
            statusBadge.backgroundColor = UIColor(named: "AccentGreen")?.withAlphaComponent(0.15)
        } else {
            statusBadge.textColor = UIColor(named: "TextSecondary")
            statusBadge.backgroundColor = UIColor(named: "TextSecondary")?.withAlphaComponent(0.15)
        }
    }
    
    //
    @IBAction func toggleChanged(_ sender: UISwitch) {
        device?.isOnline = sender.isOn
        device?.status = sender.isOn ? "Online" : "Offline"
        configureWithDevice()
    }
    
    @IBAction func removeDeviceTapped(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Remove Device",
            message: "Are you sure you want to remove \(device?.name ?? "this device")?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Remove", style: .destructive) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
