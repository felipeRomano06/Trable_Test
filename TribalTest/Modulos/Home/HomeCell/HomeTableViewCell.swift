//
//  HomeTableViewCell.swift
//  TribalTest
//
//  Created by Azteca on 28/10/21.
//

import UIKit
import CoreData

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var lLikes: UILabel!
    @IBOutlet weak var lDescription: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var mImage: UIImageView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var photo: Result?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func loadInfo(info:Result){
        self.photo = info
        let user = info.user
        let nombre = (user?.name ?? "") + (user?.lastName ?? "")
        self.lName.text = nombre
        self.lLikes.text = String(info.likes ?? 0)
        let url = URL(string: info.urls?.thumb ?? "")
        self.mImage.sd_setImage(with: url, completed: nil)
        self.lDescription.text = info.alt_description
        heartStatus()
        
    }
    
    func heartFill(){
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let boldHeart = UIImage(systemName: "heart.fill", withConfiguration: boldConfig)
        self.btnSave.setImage(boldHeart, for: .normal)
    }
    
    func heart(){
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let boldHeart = UIImage(systemName: "heart", withConfiguration: boldConfig)
        self.btnSave.setImage(boldHeart, for: .normal)
    }
    
    func heartStatus(){
        let request = MyImage.fetchRequest()
        let resultPredicate = NSPredicate(format: "url == %@", photo?.urls?.thumb ?? "")
        
        request.predicate = resultPredicate
        
        do {
            let re = try context.fetch(request)
            
            if re.count > 0 {
               
                self.heartFill()
                
            }else{
                self.heart()
                
            }
            
        }catch{
            
        }
    }
    
    @IBAction func saveImage(_ sender: Any) {
        
        let request = MyImage.fetchRequest()
        let resultPredicate = NSPredicate(format: "url == %@", photo?.urls?.thumb ?? "")
        
        request.predicate = resultPredicate
        
        do {
            let re = try context.fetch(request)
            
            if re.count > 0 {
                // elimina url
                for urls in re {
                    self.context.delete(urls)
                    try self.context.save()
                }
                self.heart()
                
            }else{
                // guarda url
                let newImage = MyImage(context: context)
                newImage.url = photo?.urls?.thumb ?? ""
                
                
                try context.save()
                self.heartFill()
                
            }
            
        }catch{
            
        }
        
    }
    
}
