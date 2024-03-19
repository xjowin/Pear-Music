import UIKit
import AVFoundation

class SongPageViewController: UIViewController {

    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    var songs : Songs!
    var song : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        songName.text = songs.name
        artistName.text = songs.author
        
        switch songName.text {
        case "yes, and?":
            songCover.image = UIImage(named: songs.imgName)
        case "greedy":
            songCover.image = UIImage(named: songs.imgName)
        case "Cruel Summer":
            songCover.image = UIImage(named: songs.imgName)
        default:
            break
        }
        
        if let str = Bundle.main.url(forResource: songs.songTitle, withExtension: "mp3")?.relativeString {
            if let url = URL(string: str) {
                song = try! AVAudioPlayer(contentsOf: url)
                song.prepareToPlay()
                song.volume = 0.5
            }
        }
    }
    
    @IBAction func playBtn(_ sender: Any) {
        let btn = sender as! UIButton

        if song.isPlaying {
            song.stop()
            btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        
        else {
            song.play()
            btn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        song.stop()

        let new = storyboard?.instantiateViewController(withIdentifier: "MusicTableViewController") as! MusicTableViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
}
