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