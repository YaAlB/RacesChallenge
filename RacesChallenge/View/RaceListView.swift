// View

import SwiftUI

struct RaceListView: View {
    @StateObject private var viewModel = RaceListViewModel()
    
    @Environment(\.sizeCategory) private var sizeCategory
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if let raceData = viewModel.raceData {
                        let sortedRaceSummaries = raceData.raceSummaries.sorted { $0.advertisedStart?.seconds ?? 0 < $1.advertisedStart?.seconds ?? 0 }
                        ForEach(sortedRaceSummaries.prefix(5)) { summary in
                            if shouldShowRace(for: summary) {
                                RaceSummaryView(summary: summary)
                            }
                        }
                    } else {
                        Text("Loading...")
                    }
                }
                .padding()
            }
            .navigationTitle("Race List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    FilterMenuView(viewModel: viewModel)
                }
            }
        }
        .onAppear {
            viewModel.fetchRaceData()
        }
        .environment(\.sizeCategory, sizeCategory) // Pass the size category to the subviews
    }
    
    // Check if a race summary should be shown based on selected categories
    private func shouldShowRace(for summary: RaceSummary) -> Bool {
        viewModel.selectedCategories.isEmpty || viewModel.selectedCategories.contains(summary.categoryId)
    }
}
