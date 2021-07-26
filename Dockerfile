COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3","rss.py"]
