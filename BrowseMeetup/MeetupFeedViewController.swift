//
//  MeetupFeedViewController.swift
//  BrowseMeetup
//
//  Created by Simon Ng on 28/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import AsyncDisplayKit

final class MeetupFeedViewController: ASViewController<ASDisplayNode>, MeetupFeedInteractorOutput {
    
    var _tableNode: ASTableNode
    var handler: MeetupFeedInteractorInput?
    var _activityIndicatorView: UIActivityIndicatorView!
    var _dataProvider: MeetupFeedTableDataProvider!
    
    init() {
        _tableNode = ASTableNode()
        super.init(node: _tableNode)
        setupInitialState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        _activityIndicatorView.hidesWhenStopped = true
        _activityIndicatorView.sizeToFit()
        
        var refreshRect = _activityIndicatorView.frame
        refreshRect.origin = CGPoint(x: (view.bounds.size.width - _activityIndicatorView.frame.width) / 2.0, y: _activityIndicatorView.frame.midY)
        
        _activityIndicatorView.frame = refreshRect
        view.addSubview(_activityIndicatorView)
        
        _tableNode.view.allowsSelection = false
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyle.none
        
        _activityIndicatorView.startAnimating()
        handler?.findGroupItemsNearby()
    }
    
    func setupInitialState() {
        title = "Browse Meetup"
        
        _dataProvider = MeetupFeedTableDataProvider()
        _dataProvider._tableNode = _tableNode
        _tableNode.dataSource = _dataProvider
    }
    
    func foundGroupItems(_ groups: [Group]?, error: Error?) {
        guard error == nil else { return }
        
        _dataProvider.insertNewGroupsInTableView(groups!)
        _activityIndicatorView.stopAnimating()
    }
}
