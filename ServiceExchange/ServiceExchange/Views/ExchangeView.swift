import SwiftUI

// Make sure all your models conform to Codable
// requests
// clicking on request -> show contact information
struct RequestListView: View {
    var requests: [Request]
    
    var body: some View {
        NavigationView {
            List(requests, id: \.self) { request in
                VStack(alignment: .leading) {
                    Text("User: \(request.user.name)")
                        .font(.headline)
                    Text("Email: \(request.user.email)")
                        .font(.subheadline)
                    Text("Phone: \(request.user.phoneNumber)")
                        .font(.subheadline)
                    Text("Exchanges: \(request.user.exchangesCount)")
                        .font(.subheadline)
                    Text("Rating: \(request.user.averageRating)")
                        .font(.subheadline)
                    Text("Post Name: \(request.post.name)")
                        .font(.subheadline)
                    Text("Item: \(request.post.item)")
                        .font(.subheadline)
                    Text("Location: \(request.post.location)")
                        .font(.subheadline)
                    Text("Time: \(request.post.time)")
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Requests")
        }
    }
}

// test
struct ExchangeView: View {
    @AppStorage("requests") private var requestData: Data = Data()

    var requests: [Request] {
        get {
            (try? JSONDecoder().decode([Request].self, from: requestData)) ?? []
        }
        set {
            requestData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    init() {
        // If requests is empty, initialize with default data
        if requests.isEmpty {
            let user1 = User(name: "John Doe", email: "john@example.com", phoneNumber: "1234567890", exchangesCount: 5, averageRating: 4.5)
            let user2 = User(name: "Alice Smith", email: "alice@example.com", phoneNumber: "9876543210", exchangesCount: 8, averageRating: 4.8)
            let post1 = Post(name: "John", item: "Tutoring", location: "Library", time: "10 AM")
            let post2 = Post(name: "Alice", item: "Chores", location: "Home", time: "2 PM")
            requests = [
                Request(user: user1, post: post1),
                Request(user: user2, post: post2)
            ]
        }
    }
    
    var body: some View {
        RequestListView(requests: requests)
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
