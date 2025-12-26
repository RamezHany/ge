# استخدم الصورة الرسمية لـ Ollama
FROM ollama/ollama:latest

# فتح البورت اللي الخدمة هتستمع عليه
EXPOSE 11434

# مجلد لحفظ الموديلات والإعدادات
VOLUME /root/.ollama

# استخدام shell للتشغيل عشان يتعرف على أمر ollama
CMD ["sh", "-c", "ollama serve --host 0.0.0.0 --port 11434"]
