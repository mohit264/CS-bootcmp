from typing import Mapping
from flask import Flask, render_template

app = Flask(__name__)
@app.route('/', methods=['Get'])

def pups():
    return "Hello Mohit, Via CSBoot Camp!"

if __name__ == '__main__':
    app.run()