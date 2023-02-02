//
//  CharacterViewModel+Test.swift
//  RickAndMortyAPITests
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

@testable import RickAndMortyAPI
import XCTest

final class CharacterViewModelTest: XCTestCase {
    var succesUseCase: CharactersUseCase?
    var failureUseCase: CharactersUseCase?
    
    var successViewModel: CharactersViewModel?
    var failureViewModel: CharactersViewModel?
    
    override func setUp() {
        super.setUp()
        succesUseCase = DefaultCharactersUseCase(repository: CharactersRepositoryRepositorySuccessMock())
        failureUseCase = DefaultCharactersUseCase(repository: CharactersRepositoryRepositoryFailureMock())
        successViewModel = DefaultCharactersViewModel(fetchCharactersUseCase: succesUseCase!)
        failureViewModel = DefaultCharactersViewModel(fetchCharactersUseCase: failureUseCase!)
    }
    
    override func tearDown() {
        succesUseCase = nil
        failureUseCase = nil
        successViewModel = nil
        failureViewModel = nil
        super.tearDown()
    }
    
    func testViewDidLoad_UseCaseSucces() {
        let expectation = expectation(description: "After the correct execution of the UseCase, the model of the view must be created and it is binded, obtaining 1 unique character.")
        
        successViewModel?.model.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertTrue(model.characters.count == 1)
            
            guard let character = model.characters.first else { return }
            
            XCTAssertNotNil(character.urlImage)
            XCTAssertNotNil(character.urlImage)
            XCTAssertNotNil(character.name)
            
            expectation.fulfill()
        }
        
        successViewModel?.error.bind { error in
            guard let _ = error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        successViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testViewDidLoad_UseCaseFailure() {
        let expectation = expectation(description: "After the execution error of the UseCase, an error should be received and it should not be null")
        
        failureViewModel?.error.bind { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        failureViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testSelectCharacter_Success() {
        let expectation = expectation(description: "When selecting any of the available character, a valid model must be created to navigate to character detail screen.")
        
        successViewModel?.model.bind { [weak self] model in
            guard let self = self,
                  let model = model,
                  let characterSelected = model.characters.first else { return }
            
            XCTAssertNotNil(model)
            self.successViewModel?.characterSelected(characterDetail: characterSelected)
        }
        
        successViewModel?.characterSelected.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertEqual(model.name, "Rick Sanchez")
            XCTAssertNotNil(model.urlImage)
        }
        
        expectation.fulfill()
        
        successViewModel?.error.bind { error in
            guard let _ = error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        successViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
}
