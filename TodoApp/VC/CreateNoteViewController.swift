//
//  CreateNoteViewController.swift
//  TodoApp
//
//  Created by Виктор on 30/09/2019.
//  Copyright © 2019 Виктор. All rights reserved.
//

import UIKit

protocol CreateNoteVCDelegate: class {
    func didCreateNote()
}

class CreateNoteViewController: UIViewController {
    
    weak var delegate: CreateNoteVCDelegate?
    
    @IBOutlet weak var newNoteTextView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func createButton(_ sender: Any) {
        
        guard let title = newNoteTextView.text, !title.isEmpty  else {
            return
        }
        addNote(newNote: title)
        delegate?.didCreateNote()
        dismiss(animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear(sender:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc
      func keyboardWillAppear(sender: Notification) {
          guard let keyboardHeight = sender.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
          let height = keyboardHeight.cgRectValue.height
          bottomConstraint.constant -= height
           UIView.animate(withDuration: 0.3) {
                      self.view.layoutIfNeeded()
                  }
            
    }
    
    @objc
    func keyboardDidAppear(sender: Notification) {
        bottomConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


    
}
