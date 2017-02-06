//
//  PartyViewCell.swift
//  Party Rock
//
//  Created by Douglas Heitner on 1/27/17.
//  Copyright © 2017 Douglas Heitner. All rights reserved.
//

import UIKit

class PartyViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle

        let url = URL(string: partyRock.imageURL)
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url!)
                
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }
            
            catch {
                //Handle Error
            }
        }
    }

}
