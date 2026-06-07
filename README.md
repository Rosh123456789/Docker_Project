# 🐳 Dockerizing a Python Flask Application

A beginner-friendly project that demonstrates how to containerize a Python Flask web application using Docker.

---

## 📁 Project Structure

```
flask-docker-project/
│
├── app.py              # The Flask web application
├── requirement.txt     # Python dependencies
├── Dockerfile          # Instructions to build the Docker image
├── demo_project.sh     # Script to automate build & run
└── README.md           # You are here!
```

---

## 🚀 How to Run

### Option 1 — Automated (Recommended for beginners)

```bash
chmod +x demo_project.sh
./demo_project.sh
```

### Option 2 — Manual Step-by-Step

```bash
# 1. Build the Docker image
docker build -t flask-docker-app .

# 2. Run the container
docker run -d --name flask-container -p 5000:5000 flask-docker-app

# 3. Open in browser
http://localhost:5000
```

---

## 🔍 Useful Docker Commands

| Command | What it does |
|---|---|
| `docker images` | List all images on your machine |
| `docker ps` | Show running containers |
| `docker ps -a` | Show all containers (including stopped) |
| `docker logs flask-container` | View app logs |
| `docker stop flask-container` | Stop the container |
| `docker rm flask-container` | Delete the container |
| `docker rmi flask-docker-app` | Delete the image |

---

## 🌐 Endpoints

| URL | Description |
|---|---|
| `http://localhost:5000/` | Home page |
| `http://localhost:5000/health` | Health check (returns JSON) |

---

## 📚 Concepts Covered

- Writing a `Dockerfile`
- Building a Docker image
- Running a Docker container
- Port mapping (`-p host:container`)
- Container lifecycle management
