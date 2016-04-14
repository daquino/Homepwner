import UIKit

class DateViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = item.dateCreated
    }
    
    @IBAction func updateItemDateCreated(sender: UIDatePicker) {
        item.dateCreated = sender.date
    }
    
}