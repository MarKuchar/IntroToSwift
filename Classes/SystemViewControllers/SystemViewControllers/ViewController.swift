//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Derrick Park on 5/20/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func shareButtonTapped(_ sender: UIButton) {
    guard let image = imageView.image else { return }
    let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    present(activityViewController, animated: true, completion: nil)
  }
  
  @IBAction func safariButtonTapped(_ sender: UIButton) {
    // 1. url
    let url = URL(string: "https://www.apple.com")!
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    guard let selectedImage = info[.originalImage] as? UIImage else { return }
    imageView.image = selectedImage
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func cameraButtonTapped(_ sender: UIButton) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
      }
      alertController.addAction(cameraAction)
    }
    
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
      }
      alertController.addAction(libraryAction)
    }
    present(alertController, animated: true, completion: nil)
  }
  
  @IBAction func emailButtonTapped(_ sender: UIButton) {
    if !MFMailComposeViewController.canSendMail() {
      print("Can not send email")
      return
    }
    let mailComposer = MFMailComposeViewController()
    mailComposer.mailComposeDelegate = self
    mailComposer.setToRecipients(["abcd@gmail.com"])
    mailComposer.setSubject("[URGENT] You've just won $1,000,000")
    mailComposer.setMessageBody("Congrats!", isHTML: false)
    
    present(mailComposer, animated: true, completion: nil)
  }
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    
    dismiss(animated: true, completion: nil)
  }
  
}

