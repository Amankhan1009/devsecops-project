from flask import Flask

AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

app = Flask(__name__)

@app.route("/")
def home():
    return "DevSecOps Pipeline Running"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
