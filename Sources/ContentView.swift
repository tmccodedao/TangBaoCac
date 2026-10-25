import SwiftUI

struct ContentView: View {
    @State private var soLinhThach: Int = 15000000
    @State private var textNhapLieu: String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Nền tối tu tiên
            
            VStack(spacing: 30) {
                VStack {
                    Text("TÀNG BẢO CÁC")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundColor(.gray)
                        .padding(.top, 40)
                    
                    Text("\(soLinhThach) Linh Thạch")
                        .font(.system(size: 36, weight: .bold, design: .serif))
                        .foregroundColor(.yellow)
                }
                
                // Các Quỹ
                HStack(spacing: 15) {
                    QuyView(tenQuy: "Sinh Tồn", soDu: 5000, icon: "flame.fill")
                    QuyView(tenQuy: "Tụ Linh (Tiết Kiệm)", soDu: 10000, icon: "leaf.fill")
                }
                
                Spacer()
                
                // Ô Truyền Âm cho Khí Linh (AI)
                VStack(alignment: .leading) {
                    Text("Truyền âm nhập mật:")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    HStack {
                        TextField("VD: Đổ xăng 50k...", text: $textNhapLieu)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            // TODO: Gắn Gemini API vào đây
                            print("Đang gọi Khí Linh...")
                        }) {
                            Image(systemName: "paperplane.fill")
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct QuyView: View {
    var tenQuy: String
    var soDu: Int
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.yellow)
                .font(.title2)
                .padding(.bottom, 2)
            Text(tenQuy)
                .font(.caption)
                .foregroundColor(.white)
            Text("\(soDu)k")
                .font(.callout)
                .foregroundColor(.gray)
        }
        .frame(width: 160, height: 100)
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.yellow.opacity(0.3), lineWidth: 1))
    }
}
