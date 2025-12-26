FROM ubuntu:22.04

RUN apt-get update && apt-get install -y wget tar curl

# تحميل النسخة التنفيذية
RUN wget -O /usr/local/bin/ollama https://github.com/ollama/ollama/releases/download/v0.13.5/ollama-linux-amd64.tgz
RUN chmod +x /usr/local/bin/ollama

# إنشاء مجلد لتخزين الموديلات
VOLUME /root/.ollama
WORKDIR /root

# تحميل الموديل
RUN ollama pull gemma3:1b

EXPOSE 11434
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
