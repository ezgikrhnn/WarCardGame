//
//  ContentView.swift
//  War Card Game
//
//  Created by Ezgi Karahan on 12.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    /*
     @State özelliği, bu kullanıcı arayüzündeki değişken değerlerin takibini sağlar.
     Örneğin, bir düğmeye tıklandığında veya başka bir etkileşim gerçekleştiğinde, playerCard veya cpuCard değişkeninin değeri değişirse, SwiftUI otomatik olarak bu değişiklikleri algılar ve kullanıcı arayüzünde bu değişkenlere bağlı bileşenleri (örneğin, bir metin etiketi veya bir görüntü) günceller.*/
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
    
            ZStack{
                Image("background-plain")
                    .resizable()
                    .ignoresSafeArea() //tüm ekranı kaplaması için
                
                VStack{ //bu vstack tüm ögelerimizi içerecek.
                    Spacer()
                    Image("logo") //logo etrafına spacer ekledim ki biraz ortalayıp boşluk bıraksın.
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Image(playerCard)
                        Spacer()   //buraya da spacer koydum kartları kenarlara itsin diye.
                        Image(cpuCard)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    
                    Button { //butonu seçmek istediğimde labellı olanı seçiyorum ki resmi buton yapabileyim.
                        deal()   //burada deal() fonksiyonunu çağırıyorum.
                    } label: {
                        Image("button")
                    }

                    
                    
                    
                    Spacer() //vuraya spacer ekledim aşağıdaki hstackle arasına mesafe koysun.
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .padding()
                            Text(String(playerScore))
                                .font(.largeTitle)  //o yazısını büyüttü.
                        }
                        
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .padding()
                            Text(String(cpuScore))
                                .font(.largeTitle)  // 0 yazısını büyüttü.
                        
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    Spacer()
                   
                }
                
            }
        }
    
    func deal(){
        let playerCardValue = Int.random(in: 2...14)
        // randomize the player cards
        playerCard = "card" + String(playerCardValue)
        
        //randomize the cpus card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        //bu iki kodu yazdıktan sonra var önüne @state getirdim.
        
        
        //update the score
        if playerCardValue > cpuCardValue {
            //playerScore'a 1 ekle
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue {
            cpuScore += 1
            
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

