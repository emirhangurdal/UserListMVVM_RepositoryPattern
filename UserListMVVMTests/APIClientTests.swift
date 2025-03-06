//
//  APIClientTests.swift
//  UserListMVVMTests
//
//  Created by Emir Gurdal on 5.03.2025.
//

import XCTest
@testable import UserListMVVM

class APIClientTests: XCTestCase {
    
    var apiClient: APIClient!
    var mockSession: URLSession!
    
    override func setUp() {
        super.setUp()
        //: Testing with session and instance of APIClient to check error and data completions. 
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        let session = URLSession(configuration: configuration)

        apiClient = APIClient(session: session)
        
    }
    
    override func tearDown() {
        apiClient = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testFetchSuccess() {
        
        let mockData = """
        [
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
              }
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets"
            }
          }
        ]
        """.data(using: .utf8)!
        
        let mockResponse = HTTPURLResponse(url: URL(string: "https://jsonplaceholder.typicode.com/users")!,
                                           statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        URLProtocolMock.testURLs = [URL(string: "https://jsonplaceholder.typicode.com/users")!: mockData]
        URLProtocolMock.response = mockResponse
        
        let expectation = self.expectation(description: "Fetch should succeed")
        
        apiClient.fetch(endpoint: "users") { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.first?.id, 1)
                XCTAssertEqual(users.first?.name, "Leanne Graham")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, got failure")
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
}


