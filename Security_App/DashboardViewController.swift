//
//  DashboardViewController.swift
//  Security_App
//
//  Created by Ryan Kibet on 20/03/2026.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var statusCard: UIView!
    @IBOutlet weak var statusValue: UILabel!
    @IBOutlet weak var statusBadge: UILabel!
    @IBOutlet weak var statusSublabel: UILabel!
    
    
    @IBOutlet weak var addDeviceButton: UIButton!
    @IBOutlet weak var logsButton: UIButton!
    
    
    @IBOutlet weak var alert1: UIView!
    @IBOutlet weak var alert2: UIView!
    @IBOutlet weak var alert3: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addDeviceTapped(_ sender: Any) {
    }
    
    
    @IBAction func logsTapped(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
