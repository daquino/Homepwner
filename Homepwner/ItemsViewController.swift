import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return itemStore.allItems.filter({ (item) -> Bool in
                return item.valueInDollars >= 50
            }).count
        }
        else {
            return itemStore.allItems.filter({ (item) -> Bool in
                return item.valueInDollars < 50
            }).count + 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        let items: [Item]
        if(indexPath.section == 0) {
            print("Section 1")
            items = itemStore.allItems.filter({ (item) -> Bool in
                return item.valueInDollars >= 50
            });
        }
        else {
            print("Section 2")
            items = itemStore.allItems.filter({ (item) -> Bool in
                return item.valueInDollars < 50
            });
        }
        
        if(indexPath.row >= items.count) {
            cell.textLabel?.text = "No more items!"
            cell.detailTextLabel?.text = ""
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font?.fontName)!, size: 20)
        }
        else {
            let item = items[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "\(item.valueInDollars)"
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font?.fontName)!, size: 44)
        }

        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        if(section == 0) {
            header.text = "Items over $50"
        }
        else {
            header.text = "Items under $50"
        }
        return header
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height: CGFloat
        let items = itemStore.allItems.filter({ (item) -> Bool in
            return item.valueInDollars < 50
        });
        if(indexPath.section == 1 && indexPath.row >= items.count) {
            height = 44
        }
        else {
            height = 60
        }
        return height
    }

}