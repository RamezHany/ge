# استخدم الصورة الرسمية لـ Ollama
FROM ollama/ollama:latest

# مجلد لحفظ الموديلات والـ configs
VOLUME /root/.ollama

# فتح البورت الخاص بـ Olama API
EXPOSE 11434

# تحميل الموديل أثناء بناء الصورة (اختياري)
# لاحظ: ممكن تفعل السطر ده لو عايز الموديل يكون جاهز من البداية
# RUN ollama pull gemma3:1b

# CMD لتشغيل Olama API عند تشغيل الكونتينر
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
