FROM python:3.10

EXPOSE ${PORT_WEB}

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD streamlit run Home.py --server.port=${PORT_WEB} --server.address=0.0.0.0
