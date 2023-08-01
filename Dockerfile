FROM python:3.10

EXPOSE ${PORT_WEB}

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --upgrade pip

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD streamlit run app.py --server.port=${PORT_WEB} --server.address=0.0.0.0
