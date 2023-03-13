import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused:Bool
    @State private var checkAmount=0.0
    @State private var numberOfPeople=2
    @State private var tipPercentage=20
    let tipPercentages=[10,15,20,25,0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalCheckAmount:Double{
        _ = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View{
        
        NavigationView{
            VStack{
                Form{
                    Section{
                        TextField("Amount",value: $checkAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad).foregroundColor(Color.black)
                        Picker("Number of people",selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }.foregroundColor(Color.black)
                    }.listRowBackground(Color.yellow)
                    Section{
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.segmented)
                        Button("More"){
                            
                        }.foregroundColor(Color.black)
                    } header: {
                        Text("How much tip do you want to leave?").foregroundColor(Color.white)
                    }.listRowBackground(Color.yellow)
                    
                    Section {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    } header: {
                        Text("Amount per person").foregroundColor(Color.white)
                    }.listRowBackground(Color.yellow).foregroundColor(Color.black)
                    
                    Section {
                        Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    } header: {
                        Text("Total check amount").foregroundColor(Color.white)
                    }.listRowBackground(Color.yellow).foregroundColor(Color.black)
                }
            }.background(Color.black).scrollContentBackground(.hidden)
            
            
        }.navigationTitle("Split It")
            .toolbar{
                ToolbarItemGroup(placement:.keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused=false
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
