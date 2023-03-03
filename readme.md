Triển khai dự án AI bằng docker

Bước 1: tạo thư mục chứa tất cả các file của dự án:
Trong ví dụ này sẽ gồm:
1. data: final_data.csv (data đã được làm sạch)
2. streamlit file: Income_pre.py (Chương trình chạy AI trên streamlit)
3. file thư viện yêu cầu: requirement.txt (file cài đặt thư viện cần thiết)

Bước 2: tạo file Dockerfile dùng để khởi chạy chương trình:

```python
#dùng python 3.9 nếu docker đã hỗ trợ
FROM python:3.9

# ttaoj thư mục app để chứa app
RUN mkdir /app

# di chuyển đến thư mục app
WORKDIR /app

# copy toàn bộ file hiện tại vào app
COPY ./ /app

# cài đặt thư viện 
RUN pip install -r requirement.txt

#run:
# lệnh để chạy app
CMD ["streamlit", "run", "Income_pre.py"]
```