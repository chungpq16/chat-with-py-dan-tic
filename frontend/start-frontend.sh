#!/bin/bash

# Start the Next.js frontend
echo "Starting Next.js frontend..."

cd "$(dirname "$0")"

# Install dependencies if they're not installed
if [ ! -d "node_modules" ]; then
    echo "Installing Node.js dependencies..."
    npm install
fi

echo "Starting the frontend server on http://localhost:3000"
npm run dev