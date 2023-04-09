#performing flask imports
from flask import Flask,jsonify
import os


app = Flask(__name__) #intance of our flask application 

#Route '/' to facilitate get request from our flutter app
@app.route('/', methods = ['GET'])
def index():
    return jsonify({'greetings' : 'Hii! this is python'}) #returning key-value pair in json format

port = int(os.environ.get('PORT', 5000))
if __name__ == "__main__":
    app.run(debug = True, host="192.168.56.1", port=port) #debug will allow changes without shutting down the server 