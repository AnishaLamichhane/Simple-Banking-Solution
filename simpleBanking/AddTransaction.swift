//
//  AddTransaction.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//

import SwiftUI

struct AddTransaction: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var amount = ""
    @State private var bankName = "Agriculture Bank Ltd"
    @State private var accountNum = ""
    @State private var date = Date()
    @State private var remarks = ""
    
    let banks = ["Agriculture Bank Ltd","Nic Asia Bank", "Himalayan Bank Ltd","ABC Bank Ltd" ]
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount: ", text: $amount)
                    
                    Picker("Bank: ", selection: $bankName){
                        ForEach(0..<banks.count) { i in
                            Text(banks[i])
                        }
                    }
                    
                    TextField("Account Number: ", text: $accountNum)
                   
                }
                
                Section {
                    
                    TextField("Remarks: ", text: $remarks)
                }
                
                Section {
                    Button("Save") {
                        let newTransaction = Bank(context: self.moc)
                        newTransaction.amount = Int16(self.amount) ?? Int16(100)
                        newTransaction.bankName = self.bankName
                        newTransaction.accountNum = Int32(self.accountNum) ?? Int32(123456)
                        newTransaction.date = self.date
                        newTransaction.remarks = self.remarks
//                        save the content
                        try? self.moc.save()
//                        to dismiss the sheet
                        self.presentationMode.wrappedValue.dismiss()
                       
                    }
                }
            }
            .navigationBarTitle("New Transaction", displayMode: .inline)
        }
    }
}

struct AddTransaction_Previews: PreviewProvider {
    static var previews: some View {
        AddTransaction()
    }
}
