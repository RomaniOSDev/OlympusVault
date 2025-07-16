import SwiftUI

struct OnboardingView: View {
    let onFinish: () -> Void
    @State private var page = 0
    let pages: [(image: ImageResource, text: String)] = [
        (.onboard1, "Create your personal relic collection"),
        (.onboard2, "Add relics to your favorites to keep them close."),
        (.onboard3, "Unlock the secrets of legendary relics")
    ]
    var body: some View {
        ZStack {
            Color.perpeleApp.ignoresSafeArea()
            ZStack(alignment: .bottom) {
                
                Image(pages[page].image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                
                VStack{
                    Text(pages[page].text)
                        .foregroundStyle(.lightPerple)
                        .font(.system(size: 32, weight: .bold, design: .default))
                    HStack{
                        Spacer()
                        Text("\(page + 1)/\(pages.count)")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    Button(action: {
                        if page < pages.count - 1 {
                            page += 1
                        } else {
                            onFinish()
                        }
                    }) {
                        Text("Next")
                            .foregroundStyle(.perpeleApp)
                            .padding(10)
                            .padding(.horizontal, 24)
                            .background {
                                Color.perpleApp.cornerRadius(8)
                            }
                    }
                }
                .padding()
                .background {
                    Color.blackblue.ignoresSafeArea()
                }
                
            }
            .animation(.easeInOut, value: page)
        }
    }
}

#Preview {
    OnboardingView(onFinish: {})
}
