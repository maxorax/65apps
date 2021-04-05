//
//  MyTableViewCell.swift
//  task1
//
//  Created by Maxorax on 02.04.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func downloadImage(withURL url: URL, forCell cell: MyTableViewCell){
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
            cell.img.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
