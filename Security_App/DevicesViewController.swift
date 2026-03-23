import UIKit

class DevicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data
    let devices: [Device] = [
        Device(id: 1, name: "Front Door Lock", type: "Smart Lock", status: "Online", lastActive: "9:41 AM", isOnline: true),
        Device(id: 2, name: "Back Door Lock", type: "Smart Lock", status: "Offline", lastActive: "10:41 AM", isOnline: false),
        Device(id: 3, name: "Security Camera", type: "Camera", status: "Online", lastActive: "10:41 AM", isOnline: true),
        Device(id: 4, name: "Living Room Light", type: "Smart Light", status: "Offline", lastActive: "9:30 AM", isOnline: false)
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundPrimary")
        tableView.backgroundColor = UIColor(named: "BackgroundPrimary")
        setupTableView()
    }
    
    // MARK: - Setup
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "BackgroundPrimary")
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.register(UINib(nibName: "DeviceCell", bundle: nil), forCellReuseIdentifier: "DeviceCell")
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as! DeviceCell
        let device = devices[indexPath.row]
        cell.configure(name: device.name, type: device.type, status: device.status, lastActive: device.lastActive)
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = devices[indexPath.row]
        performSegue(withIdentifier: "toDeviceDetails", sender: selectedDevice)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeviceDetails" {
            let destination = segue.destination as! DeviceDetailsViewController
            destination.device = sender as? Device
        }
    }
}
