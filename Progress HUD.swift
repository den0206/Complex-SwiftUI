//
//  Progress HUD.swift
//  Complex-SwiftUI-
//
//  Created by 酒井ゆうき on 2020/09/06.
//

import SwiftUI

struct Progress_HUD: View {
    
    @State private var nativeAlert = false
    @State private var showHud = false
    @State private var customAlert = false
    @State private var password = "a"
     
    var body: some View {
        
        ZStack {
            VStack(spacing : 20) {
                
                Button(action: {
                    withAnimation {
                        showAlert()
                    }
                    
                }, label: {
                    Text("Native")
                })
                
                Text(password)
                
                
                Button(action: {
                    
                    withAnimation{
                        showHud.toggle()
                    }
                    
                }, label: {
                    Text("HUD")
                })
                
                
                Button(action: {
                    customAlert.toggle()
                }, label: {
                    Text("Custoim")
                })
                
            }
            
            if showHud {
                ProgressHUD(placeHolder: "Loading", show: $showHud)
                
                
            }
            
            if customAlert {
                CustomAlertView(show: $customAlert)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Ligin", message: "Enter", preferredStyle: .alert)
        
        alert.addTextField { (pass) in
            pass.isSecureTextEntry = true
            pass.placeholder = "Password"
        }
        
        let login = UIAlertAction(title: "Login", style: .default) { (_) in
            
            password = alert.textFields![0].text!
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(login)
       
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }

}

struct Progress_HUD_Previews: PreviewProvider {
    static var previews: some View {
        Progress_HUD()
    }
}

struct ProgressHUD : View {
    
    var placeHolder :String
    @Binding var show : Bool
    @State private var animation = false
    
    var body: some View {
        
        VStack(spacing:28) {
            
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [Color.primary, Color.primary.opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                .frame(width: 80, height: 80)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
            
            Text(placeHolder)
                .fontWeight(.bold)
    
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 25)
        .background(BlurView())
        .cornerRadius(15)
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35))
        .onTapGesture( perform: {
            withAnimation{
                show.toggle()
            }
        })
        .onAppear(perform: {
            
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                animation.toggle()
            }
        })
        
    }
}


struct BlurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}


struct CustomAlertView : View {
    
    @Binding var show : Bool
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            VStack {
                
                Image(systemName: "person.fill")
                    .foregroundColor(.red)
                
                Text("Congratiration")
                    .font(.title)
                    .foregroundColor(.pink)
                
                Button(action: {
                    show.toggle()
                }, label: {
                    Text("back")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.green)
                })
                
                
            }
            .padding(.vertical, 25)
            .padding(.horizontal,35)
            .background(BlurView())
            .cornerRadius(25)
            
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding(.trailing)
                .padding(.top)
            
                
 
        })
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35))
        .onTapGesture( perform: {
            withAnimation{
                show.toggle()
            }
        })

    }
}
