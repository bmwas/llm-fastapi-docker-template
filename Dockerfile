FROM huggingface/transformers-pytorch-gpu:4.28.1

ARG MODEL_ID

WORKDIR /usr/src/app/

COPY requirements.txt ./

RUN pip install --no-cache-dir -r ./requirements.txt --upgrade pip

COPY download.py .

RUN python3 download.py --model $MODEL_ID

COPY . .

ENV MODEL_ID=$MODEL_ID

CMD python3 main.py
