//
//  AddNotes.swift
//  NotesAppUikit
//
//  Created by Noman belim on 06/02/26.
//

import UIKit

class AddNotes: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var Content: UITextView!
    @IBOutlet weak var SaveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        Content.layer.borderWidth = 0.5
        titleTextField.layer.borderWidth = 0.5
        Content.layer.borderColor = UIColor.black.cgColor
        titleTextField.layer.borderColor = UIColor.black.cgColor
        Content.layer.cornerRadius = 8
        titleTextField.layer.cornerRadius = 8
        
        
        
    }
    @IBAction func AddNotes(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let content = Content.text ?? ""
        
        if title.isEmpty || content.isEmpty{
            showAlert()
        }
        var notes  = DataManager.shared.loadNotes()
        let note :[String : String] = [
            "title" : title,
            "content": content
        ]
        notes.append(note)
        DataManager.shared.saveNotes(notes)
        showAlerts()
        navigationController?.popViewController(animated: true)
    }
    
    func showAlerts() {
        
        let alert = UIAlertController(
            title: "Done",
            message: "Notes Added SuccesFUllly",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    func showAlert() {
        
        let alert = UIAlertController(
            title: "Error",
            message: "Please enter title and content",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
}

