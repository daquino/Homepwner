import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        serialNumberLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        valueLabel.font = caption1Font
    }
    
}