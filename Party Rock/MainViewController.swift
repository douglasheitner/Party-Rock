//
//  ViewController.swift
//  Party Rock
//
//  Created by Douglas Heitner on 1/25/17.
//  Copyright © 2017 Douglas Heitner. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView!
    
    var partyRocks = [PartyRock]()
    
    let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/aIslBlTkdWk\" frameborder=\"0\" allowfullscreen></iframe>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: <#T##String#>, videoURL: <#T##String#>, videoTitle: <#T##String#>)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartCell", for: indexPath) as? PartyCell{
            
            let partyRock = PartyRock[indexPath.row]
            
            cell.updateUI (partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        
        }
    }
}
