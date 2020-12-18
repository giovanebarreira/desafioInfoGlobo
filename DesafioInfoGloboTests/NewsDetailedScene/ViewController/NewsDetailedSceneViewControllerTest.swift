//
//  NewsDetailedSceneViewControllerTest.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import XCTest
@testable import DesafioInfoGlobo

class NewsDetailedSceneViewControllerTest: XCTestCase {

    var sut: NewsDetailedSceneViewController!
    var spy: NewsDetailedViewModelProtocolSpy!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        spy = NewsDetailedViewModelProtocolSpy()
        sut = NewsDetailedSceneViewController(viewModel: spy)
        loadView()
    }

    override func tearDown() {
        window = nil
        spy = nil
        sut = nil
        super.tearDown()
    }
    
    func loadView() {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }
    
    func testViewDidLoad() {
        //When
        sut.viewDidLoad()
        
        //Then
        XCTAssert(spy.getSelectedNewsCalled, "viewDidLoad(), show call getSelectedNews()")
    }
    
    func testShowSelectedNews() {
        //Given
        let model = NewsDetailedModel(editorialName: "Brasil",
                                  title: "Copa do mundo",
                                  subtitle: "Brasil vence ",
                                  authors: ["O globo"],
                                  publishedIn: "2017-03-08T12:38:23-0300",
                                  image: [Image(author: "Joao",
                                               source: "O globo",
                                               subtitle: "Gol da final",
                                               imageUrl: "https://ogimg.infoglobo.com.br/in/19603675-f58-839/FT1086A/duque-dirceu.jpg")],
                                  newsText: "goll")
        
        let viewDataType = NewsDetailedSceneViewData(model: model)
        
        
        //When
        sut.showSelectedNews(viewData: viewDataType)
        
        //Then
        XCTAssertEqual(sut.detailedNewsViewData?.title, model.title, "showSelectedNews(), should fill detailedNewsViewData with correct data")
        XCTAssertEqual(sut.detailedNewsViewData?.subtitle, model.subtitle)
        XCTAssertEqual(sut.detailedNewsViewData?.publishedIn, "08/03/17 15:38")
    }
    
    func testSetupView() {
        //Given
        let model = NewsDetailedModel(editorialName: "Brasil",
                                  title: "Copa do mundo",
                                  subtitle: "Brasil vence ",
                                  authors: ["O globo"],
                                  publishedIn: "2017-03-08T12:38:23-0300",
                                  image: [Image(author: "Joao",
                                               source: "O globo",
                                               subtitle: "Gol da final",
                                               imageUrl: "https://ogimg.infoglobo.com.br/in/19603675-f58-839/FT1086A/duque-dirceu.jpg")],
                                  newsText: "goll")
        
        let viewDataType = NewsDetailedSceneViewData(model: model)
        
        //When
        sut.showSelectedNews(viewData: viewDataType)
        sut.setupView()
        
        //Then
        XCTAssertEqual(sut.title, model.editorialName)
        XCTAssertNotNil(sut.imageNews)
        XCTAssertEqual(model.image?.first?.subtitle, "Gol da final")
    }
    
}
