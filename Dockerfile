# ──────────────────────────────────────────────
# Step 1: Choose a base image
# We use the official Python 3.11 slim image.
# "slim" = smaller size, good for production.
# ──────────────────────────────────────────────
FROM python:3.11-slim

# ──────────────────────────────────────────────
# Step 2: Set the working directory inside the container
# All future commands will run from /app
# ──────────────────────────────────────────────
WORKDIR /app

# ──────────────────────────────────────────────
# Step 3: Copy the requirements file first
# (Docker caches layers — copying requirements
# before code speeds up re-builds)
# ──────────────────────────────────────────────
COPY requirement.txt .

# ──────────────────────────────────────────────
# Step 4: Install Python dependencies
# ──────────────────────────────────────────────
RUN pip install --no-cache-dir -r requirement.txt

# ──────────────────────────────────────────────
# Step 5: Copy all remaining project files
# ──────────────────────────────────────────────
COPY . .

# ──────────────────────────────────────────────
# Step 6: Tell Docker the container listens on port 5000
# (This is just documentation — does NOT publish the port)
# ──────────────────────────────────────────────
EXPOSE 5000

# ──────────────────────────────────────────────
# Step 7: The command to run when the container starts
# ──────────────────────────────────────────────
CMD ["python", "app.py"]
