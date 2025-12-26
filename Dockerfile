# Dockerfile لتشغيل Ollama من الصورة الرسمية مباشرة
FROM ollama/ollama:latest

# افتح البورت اللي الخدمة بتستمع عليه
EXPOSE 11434

# مجلد لحفظ الموديلات
VOLUME /root/.ollama

# أمر التشغيل من الصورة الرسمية
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
