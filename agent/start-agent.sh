#!/bin/bash

# Start the Pydantic AI agent
echo "Starting Pydantic AI agent..."

# Check if .env file exists, if not copy from example
if [ ! -f .env ]; then
    echo "Creating .env file from .env.example..."
    cp .env.example .env
    echo "Please edit .env file with your API keys before running the agent again."
    exit 1
fi

# Load environment variables
source .env

# Check if required environment variables are set
if [ -z "$OPENAI_API_KEY" ] || [ "$OPENAI_API_KEY" = "your_openai_api_key_here" ]; then
    echo "Error: OPENAI_API_KEY is not set or still has placeholder value."
    echo "Please edit the .env file and set your OpenAI API key."
    exit 1
fi

if [ -z "$TAVILY_API_KEY" ] || [ "$TAVILY_API_KEY" = "your_tavily_api_key_here" ]; then
    echo "Error: TAVILY_API_KEY is not set or still has placeholder value."
    echo "Please edit the .env file and set your Tavily API key."
    exit 1
fi

# Install dependencies if they're not installed
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Starting the agent server on http://localhost:8000"
python agent.py