//
//  ViewController.swift
//  NotesAppUikit
//
//  Created by Noman belim on 06/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
//    var notes: [Note] = []
    var notes: [[String: String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.dataSource = self
        tableView.delegate = self
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        notes = DataManager.shared.loadNotes()
        tableView.reloadData()
    }
    @IBAction func PlusIcon(_ sender: UIButton) {
        let addVC = storyboard?.instantiateViewController(identifier: "AddNotes") as! AddNotes
        navigationItem.hidesBackButton = true
        navigationController?.pushViewController(addVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return notes.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "NoteCell",
            for: indexPath
        )

        cell.textLabel?.text = notes[indexPath.row]["title"]

        return cell
    }

    // Swipe to Delete
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            notes.remove(at: indexPath.row)
            DataManager.shared.saveNotes(notes)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
