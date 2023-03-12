import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount",value: 0,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people",selection: 0){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
            }
            
        }.navigationTitle("SplitIt")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
