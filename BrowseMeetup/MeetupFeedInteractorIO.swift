//
//  MeetupFeedInteractorIO.swift
//  BrowseMeetup
//
//  Created by Simon Ng on 28/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation

protocol MeetupFeedInteractorInput {
    func findGroupItemsNearby ()
}

protocol MeetupFeedInteractorOutput {
    func foundGroupItems (_ groups: [Group]?, error: Error?)
}

final class MeetupFeedInteractor: MeetupFeedInteractorInput {
    
    var dataManager: MeetupFeedDataManager?
    
    var output: MeetupFeedInteractorOutput?
    
    func findGroupItemsNearby() {
        dataManager?.searchForGroupNearby(completion: output!.foundGroupItems)
    }
}
