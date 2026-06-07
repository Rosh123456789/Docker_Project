#!/bin/bash

# ============================================================
# demo_project.sh
# Automates building and running the Flask Docker container
# ============================================================

# --- Configuration ---
IMAGE_NAME="flask-docker-app"
CONTAINER_NAME="flask-container"
PORT=5000

echo "=============================================="
echo "  🐳 Flask Docker App - Build & Run Script"
echo "=============================================="

# Step 1: Stop and remove any existing container with the same name
echo ""
echo "🧹 Step 1: Cleaning up old containers (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null && echo "  Stopped old container."
docker rm $CONTAINER_NAME 2>/dev/null && echo "  Removed old container."

# Step 2: Build the Docker image
echo ""
echo "🔨 Step 2: Building Docker image: '$IMAGE_NAME'..."
docker build -t $IMAGE_NAME .

# Check if build succeeded
if [ $? -ne 0 ]; then
    echo "❌ Docker build FAILED. Please check the errors above."
    exit 1
fi
echo "✅ Image built successfully!"

# Step 3: Run the Docker container
echo ""
echo "🚀 Step 3: Running the container on port $PORT..."
docker run -d \
    --name $CONTAINER_NAME \
    -p $PORT:5000 \
    $IMAGE_NAME

# Check if container started
if [ $? -ne 0 ]; then
    echo "❌ Container failed to start."
    exit 1
fi

# Step 4: Show status
echo ""
echo "✅ Container is running!"
echo ""
echo "=============================================="
echo "  🌐 Open in browser: http://localhost:$PORT"
echo "  💊 Health check:    http://localhost:$PORT/health"
echo "  📋 View logs:       docker logs $CONTAINER_NAME"
echo "  🛑 Stop container:  docker stop $CONTAINER_NAME"
echo "=============================================="
