//
//  TweetViewController.swift
//  Twitter
//
//  Created by Chioma Ebinum on 7/30/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tweetText.becomeFirstResponder()
    }
   
    
    @IBOutlet weak var tweetText: UITextView!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if (!tweetText.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { Error in
                print("Error posting tweet \(Error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            
        }
        
        
    }
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Set the max character limit
        let characterLimit = 140

        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)

        // TODO: Update Character Count Label

        // The new text should be allowed? True/False
        return newText.count < characterLimit
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
