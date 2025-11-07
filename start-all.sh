#!/bin/bash

# Start both the agent and frontend
echo "Starting GenAI Chatbot with Pydantic AI and ag-ui..."

# Function to kill background processes on script exit
cleanup() {
    echo "Stopping services..."
    if [ ! -z "$AGENT_PID" ]; then
        kill $AGENT_PID 2>/dev/null
    fi
    if [ ! -z "$FRONTEND_PID" ]; then
        kill $FRONTEND_PID 2>/dev/null
    fi
    exit 0
}

# Set trap to call cleanup function on script exit
trap cleanup EXIT INT TERM

# Start the agent in the background
echo "Starting Pydantic AI agent..."
cd agent
./start-agent.sh &
AGENT_PID=$!
cd ..

# Wait a moment for the agent to start
sleep 5

# Start the frontend in the background
echo "Starting Next.js frontend..."
cd frontend
./start-frontend.sh &
FRONTEND_PID=$!
cd ..

echo ""
echo "🚀 GenAI Chatbot is starting up!"
echo ""
echo "📡 Agent server: http://localhost:8000"
echo "🌐 Frontend app: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Wait for background processes
wait