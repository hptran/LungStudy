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
        presentTask(consentTask)
    }
    
    private var consentDocument: ORKConsentDocument{
        let consentDocument = ORKConsentDocument()
        //prepare consent document (title, signatures,...)
        
        
        //create sections in consent document
        
        let section1 = ORKConsentSection(type: ORKConsentSectionType.DataGathering)
        section1.title = "The title of the section goes here ...";
        section1.summary = "The summary about the section goes here ...";
        section1.content = "The content to show in learn more ...";
        //add sections into consent document
        consentDocument.sections = [section1]
        
        return consentDocument
    }
    
    private var consentTask:ORKTask{
        var steps = [ORKStep]()
        //create visual consent step
        let visualConsentStep = ORKVisualConsentStep(identifier: "visual_consent",document:consentDocument)
        
        //add visual consent step into the list of steps
        steps += [visualConsentStep]
        
        //return consent task
        return ORKOrderedTask(identifier: "consent_task", steps: steps)
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

