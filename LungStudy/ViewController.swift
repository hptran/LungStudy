//
//  ViewController.swift
//  LungStudy
//
//  Created by huy on 5/16/15.
//  Copyright (c) 2015 huy. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    private var consentTaskController:ConsentTaskController = ConsentTaskController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
//        presentTask(helloTask)
        presentTask(consentTaskController.getConsentTask())
    }
    
    
    
    //create hello task (for testing)
    private var helloTask:ORKTask{
        //create a step
        let myStep = ORKInstructionStep(identifier: "intro")
        myStep.title = "Welcome to ResearchKit";
        
        return ORKOrderedTask(identifier: "task", steps: [myStep])
    }
    
    //present task
    func presentTask(task:ORKTask){
        //present the task
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    //collect results from the presented task
    func taskViewController(taskViewController: ORKTaskViewController,
        didFinishWithReason reason: ORKTaskViewControllerFinishReason,
        error: NSError?) {
            let taskResult = taskViewController.result
            // You could do something with the result here.
            
            // Then, dismiss the task view controller.
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}

