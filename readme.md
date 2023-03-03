khi viết file requiement.txt nên cẩn thận

CMD: khởi chạy thì câu lệnh đúng, viết hoa thường phải chính xác

Câu lệnh này sẽ tạo image: thực thi các lệnh trong Dockerfile
--> docker build ./ -f .Dockerfile -t income_pre:income_pre-v1.0

Câu lệnh này sẽ tạo container: tại cổng 5003 sẽ khớp với cổng 8501 ở image.
docker run -d -p 5003:8501 income_pre:income_pre-v1.0