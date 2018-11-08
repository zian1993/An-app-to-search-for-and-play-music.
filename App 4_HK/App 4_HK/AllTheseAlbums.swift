//
//  AllTheseAlbums.swift
//  App 4_HK
//
//  Created by Hassan Khan on 11/1/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class AllTheseAlbums: UITableViewController {
    
    private var albumname : [String]
    private var date : [String]
    private var imagename : [String]
    
    //private var section :  NSUInteger
    //private var row :  NSUInteger
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Making the album.
        albumMaker()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //Initializing my private data variables here.
    required init?(coder aDecoder: NSCoder)
    {
        albumname = [String]()
        date = [String]()
        imagename = [String]()
        super.init(coder: aDecoder)
    }
    
    func albumMaker()
    {
        //Finding the path to the dictionary
        let dict_fn = Bundle.main.path(forResource: "albums_1", ofType: "plist")
        
        //Loading the file into NSDictionary
        var dict2 = NSDictionary(contentsOfFile: dict_fn!)
        
        //Can also access all keys
        albumname = dict2?.allKeys as! [String]
        
        //Can access all values:
        var values = dict2?.allValues as! [String]
        
        //Splitting the values to get the date, and the names of the image to be
        //displayed.
        for i in 0..<values.count
        {
            let valuebreak = values[i].components(separatedBy: "|")
            date.append(valuebreak[1])
            imagename.append(valuebreak[2])
        }
        
        //At this point I have the names and the dates as string arrays, as well as the image
        //names.
        //Next step: making the cells, my friend.
        
        /*Can access all keys/values using the following:
            
            for i in 0..<keys.count
        {
            let value = dict2![keys[i]]
            print("Key: \(keys[i])  Value: \(value)")
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //Returning the number of albums as the count for the album name.
        return (albumname.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        //Using the album name, dates and cover images for the album.
     cell.textLabel?.text = albumname[indexPath.row]
     cell.detailTextLabel?.text = date[indexPath.row]
     cell.imageView?.image = UIImage(named: imagename[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Need to pass the album name to the next table
        //view from here.
        
        //Getting the selected row
        var  index = self.tableView.indexPathForSelectedRow
        
        //Get the row
        var row = index!.row
        
        // Get the new view controller using 
        var songdude = segue.destination as! AllTheseSongs
        
        // Pass the selected object to the new view controller.
        songdude.setAlbumNImage(albumname[row], imagename[row])
        
    }
    

}
