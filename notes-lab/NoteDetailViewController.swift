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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareBtn(sender:)))


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func shareBtn(sender: UIButton) {
        // Hide the keyboard
        contentTextField.resignFirstResponder()
        // Check and see if the text field is empty
        if (contentTextField.text == "") {
            // The text field is empty so display an Alert
            displayAlert(title: "Warning", message: "Enter something in the text field!")
        } else {
            // We have contents so display the share sheet
            displayShareSheet(shareContent: contentTextField.text!)
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        return
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
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
