//
//  NewsDetailedSceneViewModelTest.swift
//  DesafioInfoGloboTests
//
//  Created by Giovane Barreira on 12/18/20.
//

import XCTest
@testable import DesafioInfoGlobo

class NewsDetailedSceneViewModelTest: XCTestCase {
    
    var sut: NewsDetailedSceneViewModel!
    var model: NewsDetailedModel!

    override func setUp() {
        super.setUp()
        model = NewsDetailedModel(editorialName: "Brasil",
                                  title: "Copa do mundo",
                                  subtitle: "Brasil vence ",
                                  authors: ["O globo"],
                                  publishedIn: "2017-03-08T12:38:23-0300",
                                  image: [Image(author: "Joao",
                                               source: "O globo",
                                               subtitle: "Gol da final",
                                               imageUrl: "https://ogimg.infoglobo.com.br/in/19603675-f58-839/FT1086A/duque-dirceu.jpg")],
                                  newsText: "goll")
        
        sut = NewsDetailedSceneViewModel(model: model)
    }

    override func tearDown() {
        model = nil
        sut = nil;
        super.tearDown()
    }
    
    func testGetSelectedNews() {
        
        //When
        sut.getSelectedNews()
    }
}
