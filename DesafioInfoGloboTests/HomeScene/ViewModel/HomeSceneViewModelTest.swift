//
//  HomeSceneViewModelTest.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import XCTest
@testable import DesafioInfoGlobo

class HomeSceneViewModelTest: XCTestCase {

    var sut: HomeSceneViewModel!
    var serviceMock: HomeSceneServiceMock!
    var spy: HomeSceneViewModelProtocolSpy!
    
    override func setUp() {
        super.setUp()
        spy = HomeSceneViewModelProtocolSpy()
        serviceMock = HomeSceneServiceSuccessMock()
        sut = HomeSceneViewModel(service: serviceMock, coordinatorDelegate: spy)
    }

    override func tearDown() {
        serviceMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testDidSelectNews() {
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
        
        let newsMock = HomeSceneViewDataItem(model: contentMock)
        
        //When
        sut.didSelectNews(newsSelected: newsMock)
        
        //Then
        XCTAssert(spy.showDetailedNewsCalled, "didSelectNews(), should be called")
        XCTAssertEqual(spy.newsSelected?.authors?.first, contentMock.authors?.first, "didSelectNews(), should get same author name")
        XCTAssertEqual(spy.newsSelected?.subtitle, contentMock.subtitle, "didSelectNews(), should get same subtitle name")
        XCTAssertEqual(spy.newsSelected?.images?.first?.author, contentMock.images?.first?.author, "didSelectNews(), should get same image author name")
    }
    
    func testGetContent() {
        //Given
        let sectionTitleName = "Brasil"
        let newsTitle = "Sérgio Cabral é denunciado pela sexta vez na Lava-Jato"
        let imageURL = "https://ogimg.infoglobo.com.br/in/20620804-669-05e/FT1086A/cabral-preso.jpg"
        
        //When
        sut.getContent()
        let firstContent = serviceMock.model[0].content?.first
        
        //Then
        XCTAssert(serviceMock.fetchListCalled, "getContent(), should call fetch list")
        XCTAssertEqual(firstContent?.section?.name, sectionTitleName, "getContent(), should bring correct section name")
        XCTAssertEqual(firstContent?.images?.first?.imageUrl, imageURL, "getContent(), should bring correct url image")
        XCTAssertEqual(firstContent?.title, newsTitle, "getContent(), should bring correct title")
    }
    
    func testGetContentFailed() {
        //Given
        serviceMock = HomeSceneServiceFailureMock(failureError: HomeSceneServiceFailureMock.Failure.requestError)
        sut = HomeSceneViewModel(service: serviceMock, coordinatorDelegate: spy)
        
        //when
        sut.getContent()
        
        //Then
        XCTAssert(serviceMock.fetchListCalled, "getContent(), should call fetch list")
        XCTAssert(serviceMock.model.first == nil, "getContent(), with failue, should return empty model")
    }

}
