FROM ubuntu:22.04

# تثبيت الأدوات الأساسية
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# تحميل الـ binary الرسمي لـ Linux x86_64
RUN wget -O /tmp/ollama.tgz "https://github.com/ollama/ollama/releases/download/v0.13.5/ollama-linux-amd64.tgz" && \
    mkdir -p /usr/local/bin/ollama_tmp && \
    tar -xvzf /tmp/ollama.tgz -C /usr/local/bin/ollama_tmp && \
    mv /usr/local/bin/ollama_tmp/ollama /usr/local/bin/ollama && \
    chmod +x /usr/local/bin/ollama && \
    rm -rf /tmp/ollama.tgz /usr/local/bin/ollama_tmp

# مجلد لحفظ الموديلات
VOLUME /root/.ollama

# المجلد الرئيسي داخل الكونتينر
WORKDIR /root

# فتح البورت الخاص بـ Olama API
EXPOSE 11434

# CMD لتشغيل Olama API
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
