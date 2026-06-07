from flask import Flask

# Create a Flask application instance
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def home():
    return '''
    <h1>🐳 Hello from Docker!</h1>
    <p>Your Flask app is running inside a Docker container.</p>
    <p>Congratulations! You just Dockerized a Python Flask Application 🎉</p>
    '''

# Define a health check route (useful in real DevOps projects)
@app.route('/health')
def health():
    return {"status": "healthy", "message": "App is running fine!"}

# Run the app
if __name__ == '__main__':
    # host='0.0.0.0' makes the app accessible outside the container
    app.run(host='0.0.0.0', port=5000, debug=True)
