//
//  NewsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let news: [News] = [
        News(userPhotoImage: UIImage(named: "g1"), userNameLabel: "Dick", dateCreated: Date(timeIntervalSince1970: 123456789), newsText: "Very faint planetary nebula Abell 7 is some 1,800 light-years distant, just south of Orion in planet Earth's skies in the constellation Lepus, The Hare. Surrounded by Milky Way stars and near the line-of-sight to distant background galaxies, its generally simple spherical shape, about 8 light-years in diameter, is outlined in this deep telescopic image. Within its confines are beautiful, more complex details enhanced by the use of narrowband filters. Emission from hydrogen is shown in reddish hues with oxygen emission mapped to green and blue colors, giving Abell 7 a natural appearance that would otherwise be much too faint to be appreciated by eye. A planetary nebula represents a very brief final phase in stellar evolution that our own Sun will experience 5 billion years hence, as the nebula's central, once sun-like star shrugs off its outer layers. Abell 7 itself is estimated to be 20,000 years old. Its central star is seen here as a fading white dwarf some 10 billion years old.",
         newsPhoto: [
         NewsPhoto(newsPhoto: UIImage(named: "Abell_7"))
         ]
             )
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.newsAndPhotoTableViewCell, for: indexPath) as? NewsAndPhotoTableViewCell else { preconditionFailure("Error")}

        let new = news[indexPath.row]
        cell.updateNews(with: new)

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
