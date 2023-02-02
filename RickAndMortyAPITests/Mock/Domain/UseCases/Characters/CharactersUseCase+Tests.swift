//
//  CharactersUseCase+Tests.swift
//  RickAndMortyAPITests
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

@testable import RickAndMortyAPI
import XCTest

final class CharactersUseCaseTests: XCTestCase {
    var succesUseCase: CharactersUseCase?
    var failureUseCase: CharactersUseCase?
    
    override func setUp() {
        super.setUp()
        succesUseCase = DefaultCharactersUseCase(repository: CharactersRepositoryRepositorySuccessMock())
        failureUseCase = DefaultCharactersUseCase(repository: CharactersRepositoryRepositoryFailureMock())
    }
    
    override func tearDown() {
        succesUseCase = nil
        failureUseCase = nil
        super.tearDown()
    }
    
    func testCharactersUseCaseTest_Success() {
        // GIVEN
        let expectation = expectation(description: "You should get a valid decodable that contains 1 character of Rick and Morty")
        
        succesUseCase?.execute { result in
            switch result {
            case .success(let decodable):
                XCTAssertNotNil(decodable.info)
                XCTAssertNotNil(decodable.results)
                XCTAssertTrue(decodable.results?.count == 1)

                guard let characters = decodable.results else {
                    XCTFail("Can not unwrap the characters array")
                    return
                }
                
                for character in characters {
                    XCTAssertNotNil(character.id)
                    XCTAssertNotNil(character.name)
                }
                
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testCharactersUseCaseTest_Failure() {
        let expectation = expectation(description: "You should get an error and it should not be null")
        
        failureUseCase?.execute { result in
            switch result {
            case .success:
                XCTFail("Failure test must not succedd when the usecase is executed")
            case .failure(let error):
                XCTAssertNotNil(error)
                
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
