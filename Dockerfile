FROM ollama/ollama:latest

VOLUME /root/.ollama

EXPOSE 11434

# CMD لتشغيل Olama API عند تشغيل الكونتينر
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
