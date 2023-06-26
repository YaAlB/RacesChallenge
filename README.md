# Races Challenge App

The Races Challenge App is a simple iOS application that displays a list of upcoming races from a remote API. Users can filter the list based on selected categories and view race details.

## Features

- Fetches race data from a remote API.
- Displays a list of race summaries, including race number, meeting name, and advertised start time.
- Allows filtering the race list based on selected categories.
- Updates the advertised start times of races periodically.
- Provides a user-friendly interface with SwiftUI.

## Requirements

- Xcode 12.0 or later
- iOS 14.0 or later
- Swift 5.0 or later

## Installation

1. Clone the repository:

```
git clone https://github.com/YaAlB/RacesChallenge.git
```

2. Open the project in Xcode:

```
cd races-challenge-app
open RacesChallengeApp.xcodeproj
```

3. Build and run the project using the iOS Simulator or a physical device.

## Usage

- Launch the app on the iOS Simulator or a physical device.
- The race list will be fetched from the remote API and displayed.
- Use the filter menu to select the categories you want to view.
- The race list will update periodically to show the latest advertised start times.

## Structure

The codebase is structured as follows:

- `Model`: Contains the data models representing race data and race summaries.
- `ViewModel`: Contains the view model that manages the race data, selected categories, and API interactions.
- `View`: Contains the SwiftUI views for displaying the race list, filter menu, and race summaries.

## Scalable Layouts

The Race List App uses scalable layouts to ensure that the app can respond to font scale changes. The SwiftUI framework automatically adjusts the layout and font sizes based on the user's accessibility settings.

## Testing

The Race List App includes unit tests to ensure the correctness of the `RaceListViewModel`. The following tests are included:

- `testFetchRaceData`: Tests the fetching of race data from the remote API.
- `testFilterByCategory`: Tests the filtering of the race list based on selected categories.
- `testInitialSelectedCategories`: Tests the initial state of selected categories.
- `testIsCategorySelected`: Tests the selection of categories.
- `testFetchRaceDataWithInvalidURL`: Tests the handling of invalid URLs during race data fetching.
- `testFetchRaceDataWithNoData`: Tests the handling of scenarios where no data is received.
- `testFetchRaceDataWithInvalidJSON`: Tests the handling of invalid JSON during data decoding.

## Documentation

For more details about the code and its components, refer to the inline comments in the code files.

## License

The Race List App is open source and available under the [MIT License](LICENSE).

## Acknowledgements

The Race List App makes use of the following third-party libraries:

- SwiftUI: Apple's modern UI framework for building iOS apps.
- Foundation: Apple's framework providing fundamental infrastructure for building apps.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please create a GitHub issue or submit a pull request.
