//
//  ViewController.swift
//  swift播放本地视频
//
//  Created by andy on 15/7/17.
//  Copyright (c) 2015年 andy. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var pc:MPMoviePlayerViewController!
    var picker:UIImagePickerController!
    var videoUrl:NSURL?
    var player:MPMoviePlayerViewController!
    @IBAction func PlayVideo(sender: AnyObject) {
        if let url = videoUrl{
            player = MPMoviePlayerViewController(contentURL: url);presentViewController(player, animated: true, completion: nil)
        }else{
            var alert = UIAlertView()
            alert.title = "没有录制视频"
            alert.addButtonWithTitle("确定")
            alert.addButtonWithTitle("OK")
            alert.show()
        }
    }
    @IBAction func StartRecording(sender: AnyObject) {
        picker = UIImagePickerController()
        picker.mediaTypes = [kUTTypeMovie!]
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        videoUrl = info[UIImagePickerControllerMediaURL] as? NSURL
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    播放本地视频
    @IBAction func button(sender: AnyObject) {
        print("dd")
        pc = MPMoviePlayerViewController(contentURL: NSBundle.mainBundle().URLForResource("popeye", withExtension: "mp4"))
        presentViewController(pc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

