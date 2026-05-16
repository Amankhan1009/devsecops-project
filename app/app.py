from flask import Flask

password = "admin123"

app = Flask(__name__)

@app.route("/")
def home():
    return "DevSecOps Pipeline Running"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
