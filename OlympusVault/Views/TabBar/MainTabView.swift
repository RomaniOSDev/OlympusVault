import SwiftUI

struct MainTabView: View {
    init(){
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "blackblue")
        
        // Цвет иконок и текста у невыбранных элементов
        appearance.stackedLayoutAppearance.normal.iconColor = .lightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        
        // Цвет иконок и текста у выбранного элемента
        appearance.stackedLayoutAppearance.selected.iconColor = .lightPerple
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .white // цвет выбранного (для SwiftUI)
    }
    var body: some View {
        TabView {
            CollectionListView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Collection")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            CodexView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Relic Codex")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainTabView()
}
