//
//  AllTheseSongs.swift
//  App 4_HK
//
//  Created by Hassan Khan on 11/1/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class AllTheseSongs: UITableViewController {
    
    //Initializing the private variables.
    private var albumname : String
    private var songlist : [String]
    private var composerlist: [String]
    private var imagename : String
    private var titlename : String
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Making the list of songs to display.
        songListMaker()
        
        //Setting the title of the navigation bar
        self.navigationItem.title = titlename
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        albumname = String()
        songlist = [String]()
        composerlist = [String]()
        imagename = String()
        titlename = String()
        super.init(coder: aDecoder)
    }
    
    func songListMaker()
    {
        //Finding the path to the dictionary
        let dict_fn = Bundle.main.path(forResource: (albumname+"_songs"), ofType: "plist")
        
        //Loading the file into NSDictionary
        let dict2 = NSDictionary(contentsOfFile: dict_fn!)
        
        //Can also access all keys
        songlist = dict2?.allKeys as! [String]
        
        //Can access all values:
        composerlist = dict2?.allValues as! [String]
        
    }
    
    func setAlbumNImage(_ album: String, _ image: String)
    {
        self.titlename = album
        
        //Fixing up the album name
        self.albumname = album
        albumname = albumname.uppercased()
        albumname = albumname.replacingOccurrences(of: " ", with: "_")
        
        //I had to add the album image ofcourse!
        //Otherwise cell looks too empty
        self.imagename = image
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
        return (songlist.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = songlist[indexPath.row]
        cell.detailTextLabel?.text = composerlist[indexPath.row]
        cell.imageView?.image = UIImage(named: imagename)
        
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
        
        
        //Getting the selected row
        var  index = self.tableView.indexPathForSelectedRow
        
        //Get the row
        var row = index!.row
        
        //Changing the name of the back button item
        //for the next view controller
        self.navigationItem.backBarButtonItem?.title = songlist[row]
        
        // Get the new view controller using
        var youtubedude = segue.destination as! Youtuber
        
        // Pass the selected object to the new view controller.
        youtubedude.songSetter(songlist[row], composerlist[row])

        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
