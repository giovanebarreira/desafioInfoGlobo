//
//  HomeSceneViewControllertest.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import XCTest
@testable import DesafioInfoGlobo

class HomeSceneViewControllertest: XCTestCase {
    
    var sut: HomeSceneViewController!
    var protocolSpy: HomeSceneViewModelProtocolSpy!
    var viewModel: HomeSceneViewModel!
    var service: HomeSceneServiceMock!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        service =  HomeSceneServiceSuccessMock()
        protocolSpy = HomeSceneViewModelProtocolSpy()
        viewModel = HomeSceneViewModel(service: service, coordinatorDelegate: protocolSpy)
        sut = HomeSceneViewController(viewModel: viewModel)
        loadView()
    }

    override func tearDown() {
        window = nil
        service = nil
        protocolSpy = nil
        sut = nil
        viewModel = nil
        super.tearDown()
    }
    
    func loadView() {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    func testDisplayAllNews() {
        //Given
        let contentMock = Content(authors: ["teste"],
                                  advertisement: false,
                                  subtitle: "testing feature",
                                  text: "tesing news",
                                  videos: [],
                                  updatedIn: "today",
                                  id: 1,
                                  publishedIn: "yesterday",
                                  section: Section(name: "section",
                                                   url: "www"),
                                  kind: "none",
                                  title: "title test",
                                  url: "url test",
                                  originalUrl: "original test",
                                  images: [Image(author: "somebody",
                                                source: "here",
                                                subtitle: "picture",
                                                imageUrl: "url picture")])
        
        let newsMock = HomeSceneViewData(model: [contentMock])
        
        //When
        sut.displayAllNews(newsList: newsMock)
        
        //Then
        XCTAssertNotNil(sut.newsViewData, "displayAllNews(), should fill newsViewData with received data")
        XCTAssertEqual(sut.newsViewData?.contentList.first?.newsTitle, contentMock.title, "displayAllNews(), should get correct newsTitle")
    }
    
    func testDidSelectRowAt() {
        //Given
        let contentMock = Content(authors: ["teste"],
                                  advertisement: false,
                                  subtitle: "testing feature",
                                  text: "tesing news",
                                  videos: [],
                                  updatedIn: "today",
                                  id: 1,
                                  publishedIn: "yesterday",
                                  section: Section(name: "section",
                                                   url: "www"),
                                  kind: "none",
                                  title: "title test",
                                  url: "url test",
                                  originalUrl: "original test",
                                  images: [Image(author: "somebody",
                                                source: "here",
                                                subtitle: "picture",
                                                imageUrl: "url picture")])
        
        let newsMock = HomeSceneViewData(model: [contentMock])
        
        loadView()
        sut.displayAllNews(newsList: newsMock)
        let tableViewSpy = HomeSceneTableViewSpy()
        
        //When
        sut.tableView(tableViewSpy, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(newsMock.contentList.first?.newsTitle, sut.newsViewData?.contentList.first?.newsTitle)
    }
}
