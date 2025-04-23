Lương Quốc Đệ MSSV: K225480106004 K58KTP
# Bài tập lớn Phân tích thiết kế game nông trại coop hybird (bản demo cơ bản)
# yêu cầu của bài toán sẽ làm:
1. Quản lý người chơi
  * Lưu thông tin người chơi (tài khoản, mật khẩu, vàng, năng lượng, kinh nghiệm…)
  * Theo dõi trạng thái đăng nhập và lần hoạt động cuối.
2. Quản lý vật phẩm
  * Bao gồm các loại như: hạt giống, cây trồng, vật nuôi, công cụ, nguyên liệu, nhà xưởng...
  * Gồm giá mua, bán, mô tả.
3. Cây trồng và quy trình trồng
  * Mỗi cây gắn với vật phẩm, có thời gian phát triển, mùa phù hợp, khả năng tái sinh.
  * Cây được trồng trên ô đất, phát triển theo thời gian
4. Vật nuôi và sản phẩm
  * Vật nuôi có sản phẩm riêng, chu kỳ sinh sản, hạnh phúc.
  * Nuôi trong chuồng, có thể theo dõi tình trạng từng con.
5. Nông trại và bản đồ đất
 *  Mỗi người chơi có 1 nông trại với kích thước, kiểu thiết kế khác nhau.
  * Ô đất và chuồng được đặt theo tọa độ.
6. Kho đồ
  * Lưu vật phẩm người chơi đang sở hữu với số lượng và vị trí.

# Tạo bảng SQL, khóa và quan hệ: 
![image](https://github.com/user-attachments/assets/5b6ba313-195f-4a73-b92b-814d1889ea76)
# Thêm các giá trị Demo vào bảng:
![image](https://github.com/user-attachments/assets/049b0b25-35ff-4571-93b9-7f80d4977d6a)
# ta nhận được các bản đại dianj như sau:
![image](https://github.com/user-attachments/assets/e5d06b7d-3065-4d9c-89d1-5a526e20f9a1)
![image](https://github.com/user-attachments/assets/fa1951aa-0058-41db-9c92-c8a76e94d7c3)
# Vậy do với yếu to là tựa game nông trại như ngoài đời thì các ô đất sẽ không thể là vô tận được
# vì vậy cần có 1 cách để đếm số ô đất đã được trồng với 1 số lượng lớn thì ta sẽ tạo 1 trường phi chuẩn mới là SoLuongODatDaTrong
# thay vì sử dụng lệnh jone lâu hơn và giúp tối ưu data, truy vấn nhanh số ô đất đã trồng đc 
# thêm trường mới SoLuongODatDaTrong vào bảng ở đây là bảng Nongtrai
![image](https://github.com/user-attachments/assets/ccacea00-ccc8-4e8f-a8c5-ebe7eacf12e8)
![image](https://github.com/user-attachments/assets/d714c884-2d8c-4202-8f14-bbbd2be110d1)
# sau khi có trường ta tạo 1 trigger với mục đính khi trồng cây thì số lượng ô đất sẽ tăng lên và ngược lại khi cây đã thu hoạch hoặc chế sẽ giảm xuống
![image](https://github.com/user-attachments/assets/f533d793-6f1b-4ee7-8157-284354ba0df9)
# vậy do là 1 đồ án game thì 1 trigger là chưa đủ vì vậy mình sẽ áp dụng cho 1 trường hợp trồng 1 cây xuống với 2 trigger dễ thấy nhất là xem ô bị trồng hay chưa 
# và sử dụng trường phi chuẩn kiểm tra ô đất đã trồng ở trên để tạo 1 điều kiện khi trồng cây là không trồng quá 20 ô đất 
![image](https://github.com/user-attachments/assets/239b54ba-8ec1-4a04-903b-659e203e6b23)
![image](https://github.com/user-attachments/assets/e54f3171-f51e-4069-a8a5-61a6b282e9f0)
# sau khi đã làm xong ta sẽ test với ban đầu là trống toàn bộ ô đất 
![image](https://github.com/user-attachments/assets/7e4a534e-e60d-4d59-972c-214536c7b462)
ta thấy trồng thành công 
![image](https://github.com/user-attachments/assets/a5b4fa06-def9-4430-9ca2-98e794c4a359)
trigger kiểm tra ô đất đã trồng hoạt động
# giờ ta thử nhiệm trigger mà ta dùng cho trường SoLuongDatDaTrong khi cho trồng full các ô đất (20)
![image](https://github.com/user-attachments/assets/556ad4bc-756b-4589-88f3-3a280f6045d1)








