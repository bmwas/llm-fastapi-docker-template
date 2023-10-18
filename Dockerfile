FROM huggingface/transformers-pytorch-gpu:4.28.1

ARG MODEL_ID

WORKDIR /usr/src/app/

COPY requirements.txt ./

RUN pip install --no-cache-dir -r ./requirements.txt --upgrade pip

COPY download.py .

## change - tiiuae/falcon-7b-instruct witth $MODEL_ID but for now hard coded.
RUN python3 download.py --model tiiuae/falcon-7b-instruct

COPY . .

ENV MODEL_ID=tiiuae/falcon-7b-instruct

CMD python3 main.py
