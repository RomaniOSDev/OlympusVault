import SwiftUI

struct LoadingView: View {
    @State private var progress: Double = 0
    let duration: Double = 5
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
            ZStack {
                Color.perpeleApp.ignoresSafeArea()
            VStack(spacing: 40) {
                Spacer()
                Image(.load)
                    .resizable()
                    .frame(width: 150, height: 150)
                Spacer()
                HStack {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("Loading...")
                        .font(.system(size: 25))
                        
                }
                .foregroundStyle(.lightPerple)
                Spacer()
            }
            .padding()
            .onReceive(timer) { _ in
                if progress < 1 {
                    progress += 0.2 / duration
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
