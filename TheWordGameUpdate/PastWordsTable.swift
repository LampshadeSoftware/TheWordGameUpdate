//
//  PastWordsTableVC.swift
//  TheWordGameUpdate
//
//  Created by Cowboy Lynk on 9/2/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class PastWordsTableVC: UITableViewController {
    
    var pastWords: [String] = ["test", "test2"]
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastWords.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.playedWord.setTitle(pastWords[indexPath.row], for: .normal)
        cell.parentVC = self
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class TableViewCell: UITableViewCell {
    var parentVC: UITableViewController!
    
    @IBOutlet weak var playedWord: UIButton!
    
    @IBAction func playedWordButtonPressed(_ sender: Any) {
        WordGame.showDefinition(forWord: playedWord.title(for: .normal)!, VC: parentVC)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
