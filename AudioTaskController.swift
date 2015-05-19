//
//  AudioTaskController.swift
//  LungStudy
//
//  Created by huy on 5/18/15.
//  Copyright (c) 2015 huy. All rights reserved.
//

import ResearchKit

class AudioTaskController{
    private var audioTask: ORKOrderedTask!
    private var intendedUseDescription:String!
    private var speechInstruction:String!
    private var shortSpeechInstruction:String!
    
    init(){
        intendedUseDescription = NSLocalizedString("Intended Use Description",comment:"")
        speechInstruction = NSLocalizedString("Speech Instruction",comment:"")
        shortSpeechInstruction = NSLocalizedString("Short speech instruction",comment:"")
        
        audioTask = ORKOrderedTask.audioTaskWithIdentifier(Identifier.AudioTask.rawValue, intendedUseDescription: intendedUseDescription, speechInstruction: speechInstruction, shortSpeechInstruction: shortSpeechInstruction, duration: 20, recordingSettings: nil, options: nil)
    }
    
    func getAudioTask()->ORKTask{
        return audioTask
    }
}
