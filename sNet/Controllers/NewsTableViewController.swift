//
//  NewsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news: [News] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var groups: [Int: Groups] = [:] {
        didSet {
            print(groups)
        }
    }
    var friends: [Int: Friends] = [:] {
        didSet {
            print(friends)
        }
    }
    
    /*
    let news: [News] = [
        News(userPhotoImage: UIImage(named: "g1"),
             userNameLabel: "Dick",
             dateCreated: Date(timeIntervalSince1970: 123456789),
             newsText: "Very faint planetary nebula Abell 7 is some 1,800 light-years distant, just south of Orion in planet Earth's skies in the constellation Lepus, The Hare. Surrounded by Milky Way stars and near the line-of-sight to distant background galaxies, its generally simple spherical shape, about 8 light-years in diameter, is outlined in this deep telescopic image. Within its confines are beautiful, more complex details enhanced by the use of narrowband filters. Emission from hydrogen is shown in reddish hues with oxygen emission mapped to green and blue colors, giving Abell 7 a natural appearance that would otherwise be much too faint to be appreciated by eye. A planetary nebula represents a very brief final phase in stellar evolution that our own Sun will experience 5 billion years hence, as the nebula's central, once sun-like star shrugs off its outer layers. Abell 7 itself is estimated to be 20,000 years old. Its central star is seen here as a fading white dwarf some 10 billion years old.",
             newsPhoto: [
                NewsPhoto(newsPhoto: UIImage(named: "Abell_7"))
             ]),
        
        News(userPhotoImage: UIImage(named: "g4"),
             userNameLabel: "Richard",
             dateCreated: Date(timeIntervalSince1970: 987654321),
             newsText: "Most galaxies don't have any rings -- why does this galaxy have two? To begin, the bright band near NGC 1512's center is a nuclear ring, a ring that surrounds the galaxy center and glows brightly with recently formed stars. Most stars and accompanying gas and dust, however, orbit the galactic center in a ring much further out -- here seen near the image edge. This ring is called, counter-intuitively, the inner ring. If you look closely, you will see this the inner ring connects ends of a diffuse central bar that runs horizontally across the galaxy. These ring structures are thought to be caused by NGC 1512's own asymmetries in a drawn-out process called secular evolution. The gravity of these galaxy asymmetries, including the bar of stars, cause gas and dust to fall from the inner ring to the nuclear ring, enhancing this ring's rate of star formation. Some spiral galaxies also have a third ring -- an outer ring that circles the galaxy even further out.",
             newsPhoto: [
                NewsPhoto(newsPhoto: UIImage(named: "NGC1512")),
                NewsPhoto(newsPhoto: UIImage(named: "Abell_7"))
             ]),
        
        News(userPhotoImage: UIImage(named: "g9"),
             userNameLabel: "Jim",
             dateCreated: Date(timeIntervalSince1970: 10987654321),
             newsText: "What's that passing in front of the Sun? It looks like a moon, but it can't be Earth's Moon, because it isn't round. It's the Martian moon Phobos. The featured video was taken from the surface of Mars a month ago by the Perseverance rover. Phobos, at 11.5 kilometers across, is 150 times smaller than Luna (our moon) in diameter, but also 50 times closer to its parent planet. In fact, Phobos is so close to Mars that it is expected to break up and crash into Mars within the next 50 million years. In the near term, the low orbit of Phobos results in more rapid solar eclipses than seen from Earth. The featured video is shown in real time -- the transit really took about 40 seconds,as shown. The videographer -- the robotic rover Perseverance (Percy) -- continues to explore Jezero Crater on Mars, searching not only for clues to the watery history of the now dry world, but evidence of ancient microbial life.",
             newsPhoto: []),
        
        News(userPhotoImage: UIImage(named: "g6"),
             userNameLabel: "Bob",
             dateCreated: Date(timeIntervalSince1970: 99999999),
             newsText: "On the upper right, dressed in blue, is the Pleiades. Also known as the Seven Sisters and M45, the Pleiades is one of the brightest and most easily visible open clusters on the sky. The Pleiades contains over 3,000 stars, is about 400 light years away, and only 13 light years across. Surrounding the stars is a spectacular blue reflection nebula made of fine dust. A common legend is that one of the brighter stars faded since the cluster was named. On the lower left, shining in red, is the California Nebula. Named for its shape, the California Nebula is much dimmer and hence harder to see than the Pleiades. Also known as NGC 1499, this mass of red glowing hydrogen gas is about 1,500 light years away. Although about 25 full moons could fit between them, the featured wide angle, deep field image composite has captured them both. A careful inspection of the deep image will also reveal the star forming region IC 348 and the molecular cloud LBN 777 (the Baby Eagle Nebula).",
             newsPhoto: [
             NewsPhoto(newsPhoto: UIImage(named: "Calif2")),
             NewsPhoto(newsPhoto: UIImage(named: "orionpines")),
             NewsPhoto(newsPhoto: UIImage(named: "Apollo")),
             NewsPhoto(newsPhoto: UIImage(named: "M104"))
             ])
        
    ]
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService().getNews(info: .newsList) { news, groups, friends in
            self.news = news
            self.friends = friends
            self.groups = groups
        }
        
        //  tableView.register(UINib(nibName: PropertyKeys.newsTableViewCell, bundle: nil), forCellReuseIdentifier: PropertyKeys.newsTableViewCell)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return news.count
        return news.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.newsAndPhotoTableViewCell, for: indexPath) as? NewsAndPhotoTableViewCell else { preconditionFailure("Error")}
        
       // let news = news[indexPath.row]
        let news = news[indexPath.row]
      //  cell.updateNews(with: news)
        cell.updateNews(with: news)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
