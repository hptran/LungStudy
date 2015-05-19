//
//  TaskController.swift
//  LungStudy
//
//  Created by huy on 5/18/15.
//  Copyright (c) 2015 huy. All rights reserved.
//

import ResearchKit

enum Identifier: String {
    // task identifiers
    case ConsentTask = "ConsentTask"
    case AudioTask = "AudioTask"
    
    //step idientifiers of consent task
    case VisualConsentStep =                    "VisualConsentStep"
    case ConsentSharingStep =                   "ConsentSharingStep"
    case ConsentReviewStep =                    "ConsentReviewStep"
    case ConsentDocumentParticipantSignature = "ConsentDocumentParticipantSignature"
    case ConsentDocumentInvestigatorSignature = "ConsentDocumentInvestigatorSignature"
}

