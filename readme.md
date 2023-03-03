## Triển khai dự án AI bằng docker ở server local:

* Yêu cầu: đã cài đặt Visual Studio code, Docker Desktop, cài đặt thư viện.
* Ảnh kết quả ở bên dưới

Chú thích: 
* Container là một chuẩn đóng gói code + các thư viện liên quan của một app giúp cho việc cài đặt nhanh trên các hệ điều hành khác nhau
* Container là ảo hóa các tầng ứng dụng cho phép đóng gói code + thư viện. Nhiều container có thể chạy trên cùng một máy và cùng chia sẻ tài nguyên của hệ điều hành, mỗi container chạy trên một process riêng, vì thế container nhẹ hơn máy ảo rất nhiều.

--> Trình tự:

#### Bước 1: Tạo thư mục chứa tất cả các file của dự án:
Trong ví dụ này sẽ bao gồm các file sau:
1. data: final_data.csv (data đã được làm sạch)
2. streamlit file: Income_pre.py (Chương trình chạy AI trên streamlit)
4. file model: cách tạo file này [ở đây](https://github.com/Harry5396/income_pre_with_streamlit)
3. file thư viện yêu cầu: requirement.txt (file cài đặt thư viện cần thiết)

#### Bước 2: Tạo file Dockerfile dùng để khởi chạy chương trình:

Nội dung file như sau:

```python
#khởi tạo môi trường có sẵn
FROM python:3.9

# tạo thư mục app để chứa app
RUN mkdir /app

# di chuyển đến thư mục app
WORKDIR /app

# copy toàn bộ file hiện tại vào thư mục app
COPY ./ /app

# cài đặt thư viện 
RUN pip install -r requirement.txt

#run:
# lệnh để chạy app
CMD ["streamlit", "run", "Income_pre.py"]
```

#### Bước 3: chạy command để tạo build image

```python
docker build ./ -f .Dockerfile -t income_pre:income_pre-v1.0

#Chú thích:
# .Dockerfile : Ngouồn
# income_pre: đường dẫn
# income_pre-v1.0: tag

```

#### Hình ảnh Docker Image:
![Screenshot 2023-03-04 at 01 25 14](https://user-images.githubusercontent.com/75346165/222799041-0bbead5e-a919-4c1f-902e-1e026e1b2c92.png)

#### Bước 4: Chạy docker container từ docker image vừa build:

```python
docker run -d -p 5004:8501 income_pre:income_pre-v1.0

# Chú thích:
# Docker container chạy ở server cổng 8501: khi app chạy phải trỏ tới cổng này.
# Docker container của client chạy ở cổng 5004
# Nghĩa là khi client truy cập vào 5004 thì sẽ mapping tới cổng 8501 của server để chạy app.

# Chú thích 2:
# Đối với ứng dụng streamlit: app sẽ mặc định chạy cổng 8501 ở server, 
# app sẽ không ở container nếu định nghĩa sai cổng này.
```

#### Hình ảnh Docker Container
![Screenshot 2023-03-04 at 01 25 23](https://user-images.githubusercontent.com/75346165/222799070-9e3fb1f4-875c-4194-87da-4700399d910c.png)


## Một số hình ảnh kết quả:

| Trên web | Trên mobie |
|---------|---------|
| ![Screenshot 2023-03-04 at 01 11 53](https://user-images.githubusercontent.com/75346165/222797735-f2d29c62-9536-4547-a20d-e180eb333573.png) | ![IMG_4516](https://user-images.githubusercontent.com/75346165/222797990-7a9fd850-2a2e-45f6-8758-14436bdf142c.jpg) |


Hi vọng giúp ích được cho bạn:
Thanks!
