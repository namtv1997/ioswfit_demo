//
//  PackageViewController.swift
//  Fintech
//
//  Created by Ta Noah on 14/12/2021.
//

import UIKit

class PackageViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var packageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    func initTableView(){
        let nib = UINib(nibName: "PackageTableViewCell", bundle: nil)

        packageTableView.register(nib, forCellReuseIdentifier: "PackageTableViewCell")
        packageTableView.delegate = self
        packageTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageTableViewCell", for: indexPath) as! PackageTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let openNewVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailPackageViewController") as! DetailPackageViewController
        self.navigationController?.pushViewController(openNewVC, animated: true)
    }

}
