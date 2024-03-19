import UIKit

class MusicTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSongs()
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell") as! MusicTableViewCell
        
        let index = indexPath.row
        let element = songsList[index]
        
        cell.music.text = element.name
        cell.artist.text = element.author
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "song_segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "song_segue" {
            let index = table.indexPathForSelectedRow!.row
            let element = songsList[index]
            
            let songP = segue.destination as! SongPageViewController
            songP.songs = element
            
            table.deselectRow(at: table.indexPathForSelectedRow!, animated: true)
        }
    }
        
    func initSongs () {
        // Fix the problem with appending new elemets to the table💃
        songsList.removeAll()
        
        let song1 = Songs(name: "yes, and?", author: "Ariana Grande", imgName: "yesAndCover", songTitle: "yesAndSong")
        let song2 = Songs(name: "greedy", author: "Tate McRae", imgName: "greedyCover", songTitle: "greedySong")
        let song3 = Songs(name: "Cruel Summer", author: "Taylor Swift", imgName: "cruelSummerCover", songTitle: "cruelSummerSong")
        
        songsList.append(song1)
        songsList.append(song2)
        songsList.append(song3)
    }
}
