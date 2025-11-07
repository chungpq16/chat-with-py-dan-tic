# Python Backend Dockerfile
FROM python:3.11-slim

# Install Node.js and npm for MCP servers
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install uvx for Python MCP servers
RUN pip install --no-cache-dir uv

WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install MCP servers
RUN npx -y @modelcontextprotocol/server-memory --version || true
RUN uvx install mcp-run-python || true

# Copy application code
COPY . .

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Run the agent
CMD ["python", "agent.py"]
