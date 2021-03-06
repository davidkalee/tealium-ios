/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A table view controller that displays filtered strings based on callbacks from a UISearchController.
*/

import UIKit

class SearchResultsViewController: SearchControllerBaseViewController, UISearchResultsUpdating {

    // MARK: Types
    struct StoryboardConstants {
        /**
            The identifier string that corresponds to the `SearchResultsViewController`'s
            view controller defined in the main storyboard.
        */
        static let identifier = "SearchResultsViewControllerStoryboardIdentifier"
    }

    // MARK: UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        /*
            `updateSearchResultsForSearchController(_:)` is called when the controller is
            being dismissed to allow those who are using the controller they are search
            as the results controller a chance to reset their state. No need to update
            anything if we're being dismissed.
        */
        guard searchController.isActive else { return }
        filterString = searchController.searchBar.text
        if let filterString = filterString {
            SearchResultsViewData.searchKeyword = filterString
        }
        TealiumHelper.trackView(SearchResultsViewData.tealiumEvent,
                                dataSources: ["screen_name": SearchResultsViewData.screenName as AnyObject,
                                              "search_results": SearchResultsViewData.searchResults as AnyObject,
                                              "search_keyword": SearchResultsViewData.searchKeyword as AnyObject])
    }
}
