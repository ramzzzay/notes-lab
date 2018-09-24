//
//  NoteDetailViewController ViewController.swift
//  notes-lab
//
//  Created by Anton on 9/23/18.
//  Copyright © 2018 ramzayCO. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    
    var note: Note!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextField.text = note.title
        contentTextField.attributedText = note.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        contentTextField.resolveHashTags()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss dd.MM.yyyy"
        
        note.title = titleTextField.text == "" ? formatter.string(from: Date()) : titleTextField.text!
        note.content = contentTextField.attributedText!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
