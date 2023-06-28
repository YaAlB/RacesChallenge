import XCTest

class RaceListViewModelTests: XCTestCase {
    var viewModel: RaceListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RaceListViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFilterByCategory() {
        // Given
        let category = "9daef0d7-bf3c-4f50-921d-8e818c60fe61" // Greyhound Racing
        
        // When
        viewModel.filterByCategory(category)
        
        // Then
        XCTAssertTrue(viewModel.isCategorySelected(category))
        
        // When
        viewModel.filterByCategory(category)
        
        // Then
        XCTAssertFalse(viewModel.isCategorySelected(category))
    }
    
    func testInitialSelectedCategories() {
        // Given
        XCTAssertEqual(viewModel.selectedCategories.count, 0)
    }

    func testIsCategorySelected() {
        // Given
        let category1 = "4a2788f8-e825-4d36-9894-efd4baf1cfae" // Horse Racing
        let category2 = "161d9be2-e909-4326-8c2c-35ed71fb460b" // Harness Racing

        // When
        viewModel.filterByCategory(category1)

        // Then
        XCTAssertTrue(viewModel.isCategorySelected(category1))
        XCTAssertFalse(viewModel.isCategorySelected(category2))
    }
}


