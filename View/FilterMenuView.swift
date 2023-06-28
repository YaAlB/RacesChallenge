// View

import SwiftUI

struct FilterMenuView: View {
    @ObservedObject var viewModel: RaceListViewModel
    
    var body: some View {
        Menu {
            Button(action: {
                viewModel.filterByCategory("9daef0d7-bf3c-4f50-921d-8e818c60fe61") // Greyhound Racing
            }) {
                Label("Greyhound Racing", systemImage: viewModel.isCategorySelected("9daef0d7-bf3c-4f50-921d-8e818c60fe61") ? "checkmark.circle.fill" : "circle")
            }
            
            Button(action: {
                viewModel.filterByCategory("161d9be2-e909-4326-8c2c-35ed71fb460b") // Harness Racing
            }) {
                Label("Harness Racing", systemImage: viewModel.isCategorySelected("161d9be2-e909-4326-8c2c-35ed71fb460b") ? "checkmark.circle.fill" : "circle")
            }
            
            Button(action: {
                viewModel.filterByCategory("4a2788f8-e825-4d36-9894-efd4baf1cfae") // Horse Racing
            }) {
                Label("Horse Racing", systemImage: viewModel.isCategorySelected("4a2788f8-e825-4d36-9894-efd4baf1cfae") ? "checkmark.circle.fill" : "circle")
            }
        } label: {
            Label("Filter", systemImage: "slider.horizontal.3")
        }
    }
}
