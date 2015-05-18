//
//  Consent.swift
//  LungStudy
//
//  Created by huy on 5/17/15.
//  Copyright (c) 2015 huy. All rights reserved.
//

import Foundation
import ResearchKit

class ConsentTaskController{
    private enum Identifier: String {
        // Consent task specific identifiers.
        case ConsentTask =                          "ConsentTask"
        case VisualConsentStep =                    "VisualConsentStep"
        case ConsentSharingStep =                   "ConsentSharingStep"
        case ConsentReviewStep =                    "ConsentReviewStep"
        case ConsentDocumentParticipantSignature =  "ConsentDocumentParticipantSignature"
        case ConsentDocumentInvestigatorSignature = "ConsentDocumentInvestigatorSignature"
    
    }
    
    private var consentDocument: ORKConsentDocument{
        let consentDocument = ORKConsentDocument()
        //prepare consent document (title, signatures,...)
        consentDocument.title = NSLocalizedString("Example Consent", comment: "")
        consentDocument.signaturePageTitle = NSLocalizedString("Consent", comment: "")
        consentDocument.signaturePageContent = NSLocalizedString("I agree to participate in this research study.", comment: "")
        let participantSignatureTitle = NSLocalizedString("Participant", comment: "")
        let participantSignature = ORKConsentSignature(forPersonWithTitle: participantSignatureTitle, dateFormatString: nil, identifier: Identifier.ConsentDocumentParticipantSignature.rawValue)
        
        consentDocument.addSignature(participantSignature)
        
        //list of section types in a consent
        let consentSectionTypes: [ORKConsentSectionType] = [
            .Overview,
            .DataGathering,
            .Privacy,
            .DataUse,
            .TimeCommitment,
            .StudySurvey,
            .StudyTasks,
            .Withdrawing
        ]
        //list of sections for section types in a consent
        var consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
            let consentSection = ContentSection(type: contentSectionType)
            return consentSection as ORKConsentSection
        }
        //add sections into consent document
        consentDocument.sections = consentSections;
        return consentDocument
    }
    
    private var consentTask:ORKTask{
        var steps = [ORKStep]()
        //create visual consent step and add it to the list of steps
        let visualConsentStep = ORKVisualConsentStep(identifier: "visual_consent",document:consentDocument)
        steps += [visualConsentStep]
        
        //create consent sharing step and add it to the list of steps
        let investigatorShortDescription = NSLocalizedString("Institution", comment: "")
        let investigatorLongDescription = NSLocalizedString("Institution and its partners", comment: "")
        let localizedLearnMoreHTMLContent = NSLocalizedString("Your sharing learn more content here.", comment: "")
        let sharingConsentStep = ORKConsentSharingStep(identifier: Identifier.ConsentSharingStep.rawValue, investigatorShortDescription: investigatorShortDescription, investigatorLongDescription: investigatorLongDescription, localizedLearnMoreHTMLContent: localizedLearnMoreHTMLContent)
        steps += [sharingConsentStep]
        
        //create consent review step and add it to the list of steps
        let signature = consentDocument.signatures!.first as! ORKConsentSignature
        
        let reviewConsentStep = ORKConsentReviewStep(identifier: Identifier.ConsentReviewStep.rawValue, signature: signature, inDocument: consentDocument)
        
        // In a real application, you would supply your own localized text.
        reviewConsentStep.text = ""
        reviewConsentStep.reasonForConsent = ""
        steps += [reviewConsentStep]

        //TODO: add investigator signature
        
        //return consent task
        return ORKOrderedTask(identifier: "consent_task", steps: steps)
    }
    
    func getConsentTask() ->ORKTask{
        return consentTask
    }
}
