// ViewModel

import Foundation

class RaceListViewModel: ObservableObject {
    @Published var raceData: RaceDataInfo?
    @Published var selectedCategories: Set<String> = [] // Track selected categories
    
    private func makeURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.neds.com.au"
        components.path = "/rest/v1/racing/"
        components.queryItems = [
            URLQueryItem(name: "method", value: "nextraces"),
            URLQueryItem(name: "count", value: "10")
        ]
        return components.url
    }
    
    func fetchRaceData() {
        guard let url = makeURL() else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let jsonData = json["data"] as? [String: Any],
                      let raceSummariesData = jsonData["race_summaries"] as? [String: [String: Any]] else {
                    print("Invalid JSON format")
                    return
                }
                
                var raceSummaries: [RaceSummary] = []
                for (_, value) in raceSummariesData {
                    if let raceId = value["race_id"] as? String,
                       let raceNumber = value["race_number"] as? Int,
                       let meetingName = value["meeting_name"] as? String,
                       let categoryId = value["category_id"] as? String,
                       let advertisedStartData = value["advertised_start"] as? [String: Int],
                       let seconds = advertisedStartData["seconds"] {
                        let advertisedStart = AdvertisedStart(seconds: seconds)
                        let raceSummary = RaceSummary(raceId: raceId, raceNumber: raceNumber, meetingName: meetingName, categoryId: categoryId, advertisedStart: advertisedStart)
                        raceSummaries.append(raceSummary)
                    }
                }
                
                DispatchQueue.main.async {
                    self.raceData = RaceDataInfo(raceSummaries: raceSummaries)
                }
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    // Filter the list based on selected categories
    func filterByCategory(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
    
    // Check if a race summary belongs to a selected category
    func isCategorySelected(_ categoryId: String) -> Bool {
        return selectedCategories.contains(categoryId)
    }
    
    private func updateAdvertisedStartTimes() {
        DispatchQueue.main.async {
            self.raceData = nil // Clear the existing data to show "Loading..." state
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            self.fetchRaceData()
            self.updateAdvertisedStartTimes()
        }
    }
    
    init() {
        updateAdvertisedStartTimes()
    }
}
