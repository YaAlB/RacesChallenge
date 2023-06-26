//import Foundation
//
//struct RaceDataInfo: Codable {
//    let raceSummaries: [RaceSummary]
//}
//
//struct RaceSummary: Codable {
//    let raceId: String
//    let raceNumber: Int
//    let meetingName: String
//    let categoryId: Int
//    let advertisedStart: AdvertisedStart?
//}
//
//struct AdvertisedStart: Codable {
//    let seconds: Int
//}
//
//func fetchRaceData() {
//    guard let url = URL(string: "https://api.neds.com.au/rest/v1/racing/?method=nextraces&count=10") else {
//        print("Invalid URL")
//        return
//    }
//
//    var request = URLRequest(url: url)
//    request.setValue("application/json", forHTTPHeaderField: "Content-type")
//
//    URLSession.shared.dataTask(with: request) { data, _, error in
//        if let error = error {
//            print("Error: \(error)")
//            return
//        }
//
//        guard let data = data else {
//            print("No data received")
//            return
//        }
//
//        do {
//            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                let jsonData = json["data"] as? [String: Any],
//                let nextToGoIDs = jsonData["next_to_go_ids"] as? [String],
//                let raceSummaries = jsonData["race_summaries"] as? [String: [String: Any]] else {
//                    print("Invalid JSON format")
//                    return
//            }
//            
//            let sortedRaceSummaries = raceSummaries.sorted { (entry1, entry2) -> Bool in
//                if let race1 = entry1.value as? [String: Any],
//                   let race2 = entry2.value as? [String: Any],
//                   let advertisedStart1 = race1["advertised_start"] as? [String: Int],
//                   let advertisedStart2 = race2["advertised_start"] as? [String: Int],
//                   let seconds1 = advertisedStart1["seconds"],
//                   let seconds2 = advertisedStart2["seconds"] {
//                       return seconds1 < seconds2 && seconds1 + 60 <= seconds2
//                }
//                return false
//            }
//
//            for (_, race) in sortedRaceSummaries {
//                if let raceNumber = race["race_number"] as? Int,
//                   let meetingName = race["meeting_name"] as? String,
//                   let advertisedStartSeconds = race["advertised_start"] as? [String: Int],
//                   let seconds = advertisedStartSeconds["seconds"] {
//                       let hours = seconds / 3600
//                       let minutes = (seconds % 3600) / 60
//                       let remainingSeconds = (seconds % 3600) % 60
//                       
//                       print("Race Number: \(raceNumber)")
//                       print("Meeting Name: \(meetingName)")
//                       print("Advertised Start: \(hours) hours \(minutes) minutes \(remainingSeconds) seconds")
//                       print("---------")
//                }
//            }
//            
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }.resume()
//}
