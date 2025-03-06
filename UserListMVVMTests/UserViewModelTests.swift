

import XCTest
@testable import UserListMVVM
//Unit Tests with Mock data to test the logic of fetching the users from the endpoint as well as error block. 
class UserViewModelTests: XCTestCase {

    func testFetchUsers_Success() {
        let mockRepo = MockUserRepository()
        let userService = UserService(repository: mockRepo)
        let viewModel = UserViewModel(userService: userService)

        let expectation = self.expectation(description: "Users updated")
        

        viewModel.onUsersUpdated = {
            XCTAssertEqual(viewModel.users.count, 1)
            XCTAssertEqual(viewModel.users.first?.name, "User 1")
            
            expectation.fulfill()
        }

        viewModel.fetchUsers()

        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchUsers_Error() {
        
        let mockRepository = MockUserRepository()
        mockRepository.shouldReturnError = true
        let userService = UserService(repository: mockRepository)
        let viewModel = UserViewModel(userService: userService)

        let expectation = XCTestExpectation(description: "Error callback should be triggered")
        
        viewModel.onError = { errorMessage in
            XCTAssertNotNil(viewModel.errorMessage, "Error message should be set")
            expectation.fulfill()
        }

        viewModel.fetchUsers()

        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchUsers_LargeDataset() {
        let mockRepo = MockUserRepository()
        mockRepo.numberOfUsers = 1000
        let userService = UserService(repository: mockRepo)
        let viewModel = UserViewModel(userService: userService)

        let expectation = self.expectation(description: "Users updated with large dataset")

        viewModel.onUsersUpdated = {
            XCTAssertEqual(viewModel.users.count, 1000, "Should have 1000 users")
            XCTAssertEqual(viewModel.users.first?.name, "User 1", "First user's name should be 'User 1'")
            XCTAssertEqual(viewModel.users.last?.name, "User 1000", "Last user's name should be 'User 1000'")
            
            expectation.fulfill()
        }

        viewModel.fetchUsers()

        wait(for: [expectation], timeout: 3.0)
    }

    
}

