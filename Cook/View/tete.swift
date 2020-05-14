
import SwiftUI

struct Profile: View {
    
    
    @State private var toggle1 = true
    @State private var toggle2 = true
    @State private var toggle3 = true
    @State private var bansearch:  String = ""
    @State private var banfood = 0
    var food = ["Avocat", "Abricot","Ananas","Brocoli", "Betrave","Cerise","Cassis","Citron"  ]
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                IntoleranceView(toogle1: $toggle1, toogle2: $toggle2, toogle3: $toggle3)
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Autres intolérances")
                        .fontWeight(.light)
                        .foregroundColor(.pink)
                        .font(.title)
                    
                    TextField("Entrez un aliment", text: $bansearch)
                    Divider()
                    
                    
                    
                    
                    
                }
                Picker(selection: $banfood, label: Text("")){
                    ForEach(0..<food.count){
                        
                        Text(self.food[$0]).tag($0)
                        
                    }
                }.labelsHidden()
                Spacer()
            }.navigationBarTitle("Profil", displayMode: .inline)
                .padding()
            
            
            
            
        }
    }
}



struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}


struct IntoleranceView: View {
    @Binding var toogle1 : Bool
    @Binding var toogle2 : Bool
    @Binding var toogle3 : Bool
    var body: some View {
        VStack(alignment: .leading) {
            
            
            Text("Intolérances/Allergies")
                .fontWeight(.light)
                .foregroundColor(Color.pink)
                .font(.title)
            
            
            Toggle(isOn: $toogle1) {
                Text("Sucre")}
            Divider()
            Toggle(isOn: $toogle2) {
                Text("Glucose")}
            Divider()
            Toggle(isOn: $toogle3) {
                Text("Lactose")}
            Divider()
            
            
            
        }
    }
}
