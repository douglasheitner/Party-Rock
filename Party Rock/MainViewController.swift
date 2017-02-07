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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a7/JohnMayerBattleStudies.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/t-a2IOKrQHY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Crossroads")
        let p2 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a7/JohnMayerBattleStudies.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5GTbM5-ku-M\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Edge of Desire")
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/8/82/Continuum_(album).png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/MZjZI6eGtcM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Belief")
        let p4 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/8/82/Continuum_(album).png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UCpwMfqXxgw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Slow Dancing in a Burning Room")
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a7/JohnMayerBattleStudies.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4GRBrHTerf0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Friends, Lovers or Nothing")
        let p6 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a7/JohnMayerBattleStudies.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/aojTGWAqUIQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Half of My Heart")
        let p7 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a7/JohnMayerBattleStudies.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/mP4cpVzw_Lc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Assassin")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        partyRocks.append(p6)
        partyRocks.append(p7)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyViewCell{
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI (partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoViewController", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController{
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }
}
