//
//  FotoDelDiaView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 14/10/24.
//

import SwiftUI

struct FotoDelDiaView: View {
    @State var datosFotoNASA = NASAInfo(title: "", url: "")
    @State var foto = Image(systemName: "camera")
    @State var date = Date()
    
    var body: some View {
        VStack {
            Text(datosFotoNASA.title)
                .font(.title)
                .padding()
            
            DatePicker("Selecciona una fecha", selection: $date, displayedComponents: .date)
                
                
            
            foto
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
        .padding()
        .onAppear() {
            Task {
                await loadData()
            }
        }
        .onChange(of: date) {
            Task {
                print("a")
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard var url = URL(string: "https://api.nasa.gov/planetary/apod")
        else {
            print("Error in url")
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let fechaStr = formatter.string(from: date)
        
        url.append(queryItems: [URLQueryItem(name: "api_key", value: "DEMO_KEY"),
            URLQueryItem(name: "date", value: fechaStr)])
        
        
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try JSONDecoder().decode(NASAInfo?.self, from: data) {
                datosFotoNASA = decodedData
                
                if let urlFoto = URL(string: decodedData.url) {
                    if let unaFoto = try? Data(contentsOf: urlFoto) {
                        if let uiimage = UIImage(data: unaFoto) {
                            foto = Image(uiImage: uiimage)
                        }
                    }
                }
            }
        } catch {
            print("error")
            return
        }
    }
}

#Preview {
    FotoDelDiaView()
}
