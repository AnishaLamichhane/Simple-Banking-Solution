//
//  TransactionView.swift
//  simpleBanking
//
//  Created by Anisha Lamichhane on 6/9/21.
//

import SwiftUI

struct TransactionView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Bank.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Bank.date, ascending: false)
    ]) var banks: FetchedResults<Bank>
    
    
    var body: some View {
        NavigationView{
            List {
                ForEach(banks, id: \.self) { bank in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(bank.wrappedRemarks)")
                                .font(.headline)
                            Text("\(bank.date ?? Date(), style: .date)")
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        Text("$\(bank.amount)")
                            .foregroundColor(.green)
                    }
                }
                .onDelete(perform: deleteTransaction)
            }
            .navigationBarTitle("Transaction History", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
                
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let bank = banks[offset]
            // delete it from the context
            moc.delete(bank)
        }
        // save the context
        try? moc.save()
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
