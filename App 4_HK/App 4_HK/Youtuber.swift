//
//  Youtuber.swift
//  App 4_HK
//
//  Created by Hassan Khan on 11/1/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class Youtuber: UIViewController, UIWebViewDelegate {

    @IBOutlet private var youtuber: UIWebView!
    @IBOutlet private var namelabel : UILabel?
    
    private var songname : String
    private var artistname : String
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting the title of the navigation bar
        self.navigationItem.title = songname
        namelabel?.text = songname
        
        //Searching for the song
        songSearcher()
        
        //Hooking up the webview to youtube

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      songname = String()
      artistname = String()
      super.init(coder: aDecoder)
    }
    
    //Refreshing all variables everytime screen pops back up
    override func viewDidAppear(_ animated: Bool) {
        self.viewDidLoad()
    }
    
    func songSetter(_ song:String, _ artist: String)
    {
        self.songname = song
        self.artistname = artist
    }
    
    func songSearcher()
    {
        //Setting up the song and artist name for search
        let songupdate = songname.replacingOccurrences(of: " ", with: "+")
        let artistupdate = artistname.replacingOccurrences(of: " ", with: "+")
        
        //Encode search for YouTube
        let keywords = "\(artistupdate)+\(songupdate)"
        let max = 50
        
        //Set the youtube search
        let string = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(keywords)&order=viewCount&maxResults=\(max)&type=video&videoCategory=Music&key=AIzaSyAJiIwkPJA1F7Xmy_jZobS0KRYA2ystamE"
        
        //A URL and request is created as before for  the UIWebView.
        let url = (URL(string: string))
        let request = URLRequest(url: url!)
        
        //Get the response by a syncchronous request (can also check for error
        let responseData = try? NSURLConnection.sendSynchronousRequest(request, returning: nil)
        
        //Convert the responsedata to a NSString
        let result = NSString(data: responseData!, encoding:String.Encoding.utf8.rawValue)
        print(result!)
        
        var titles : [String] = [String]()
        var videoIDs : [String] = [String]()
        
        //Making the json structure.
        let json = try! JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String:AnyObject]
        
        //Process the JSON structure below:
        if let items = json["items"] as? NSArray
        {
            for item in items
            {
                let item1 = item as! [String:AnyObject]
                // construct your model objects here
                //Get the title
                //Get the videoID
                let videoIDDict = item1["id"] as! NSDictionary
                //print(videoIDDict)
                let videoID = videoIDDict["videoId"] as? String
                //print(videoID)
                
                //Get the title of the video
                let snippetDict = item1["snippet"] as! NSDictionary
                let title1 = snippetDict["title"] as? String
                //print(title)
                
                //Set the data
                titles.append(title1!)
                videoIDs.append(videoID!)
            }
        }
        
        //Comparing the quality of the title and artist.
        //While a good quality video isn't found, we loop through all the titles
        //and video ids.
    
        var title_index = 0
        var booldude = false
        
        while ((title_index<titles.count) && !booldude)
        {
            booldude=((titles[title_index].contains(songname)) && (titles[title_index].contains(artistname)))
            
            if booldude{
                break
            }
            
            else
            {
                title_index = title_index+1
            }
        }
        
        //If no good video found, try to find atleast just the name match
        if (!booldude)
        {
            title_index = 0
        }
        
        while ((title_index<titles.count) && !booldude)
        {
            booldude=(titles[title_index].contains(songname))
            
            if booldude{
                break
            }
                
            else
            {
                title_index = title_index+1
            }
        }
        
        //IF STILL NOTHING GREAT IS FOUND, then just play a random one from the
        //search
        if (!booldude)
        {
            title_index = Int(arc4random_uniform(UInt32(titles.count)))
        }
        
        //Generating the URL
        let playURL = "https://www.youtube.com/watch?v=\(videoIDs[title_index])"
        
        //Generate URL from String
        let videoURL = URL(string: playURL)
        
        //Generate URLRequest from URL
        let videoRequest = URLRequest(url: videoURL!)
        
        
        //Play the video in UIWebView
        self.youtuber.loadRequest(videoRequest)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
