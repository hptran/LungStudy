//
//  ContentSection.swift
//  LungStudy
//
//  Created by huy on 5/17/15.
//  Copyright (c) 2015 huy. All rights reserved.
//

import Foundation
import ResearchKit

class ContentSection: ORKConsentSection{
    override init(type: ORKConsentSectionType){
        super.init(type: type)
        switch type{
        case .Overview:
            self.summary = overviewSummary
            self.content = overviewContent
        default:
            self.content = ""
            self.summary = ""
        }
    }
    override init(){
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var overviewSummary: String = NSLocalizedString("We are doing a research study about the correlation between lung sound and pneumonia.", comment: "")
    private var overviewContent: String = NSLocalizedString("We are doing a research study about the correlation between lung sound and pneumonia. This application will guide you fill out consent form, and collect your lung sound data.", comment: "")
    
}
