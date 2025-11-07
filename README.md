# GenAI Chatbot with Pydantic AI and ag-ui

A powerful GenAI chatbot built with **Pydantic AI** and **CopilotKit's ag-ui** that features real-time web search capabilities using **Tavily**. This chatbot provides an intelligent agentic chat interface where the AI can search the web for current information and provide contextual, up-to-date responses.

## 🚀 Features

- **🤖 Pydantic AI Agent**: Modern Python agent framework with type safety
- **🔍 Real-time Web Search**: Integrated Tavily search for current information
- **💬 Agentic Chat UI**: Interactive chat interface powered by CopilotKit
- **🔗 AG-UI Protocol**: Standard protocol for agent-to-UI communication
- **⚡ Next.js Frontend**: Modern React-based frontend with TypeScript
- **🎨 Custom UI Components**: Visual feedback for search operations
- **📱 Responsive Design**: Works on desktop and mobile devices

## 🏗️ Architecture

```
┌─────────────────┐    AG-UI Protocol    ┌─────────────────┐
│   Next.js       │◄──────────────────►│ Pydantic AI     │
│   Frontend      │                      │ Agent           │
│   (Port 3000)   │                      │ (Port 8000)     │
│                 │                      │                 │
│ ┌─────────────┐ │                      │ ┌─────────────┐ │
│ │ CopilotKit  │ │                      │ │ Tavily      │ │
│ │ Components  │ │                      │ │ Search      │ │
│ └─────────────┘ │                      │ │ Tool        │ │
└─────────────────┘                      │ └─────────────┘ │
                                         └─────────────────┘
```

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Python 3.8+** with pip
- **Node.js 18+** with npm
- **Git** (for cloning the repository)

You'll also need API keys for:
- **OpenAI API** (for the LLM)
- **Tavily API** (for web search)

## 🔑 Getting API Keys

### OpenAI API Key
1. Go to [OpenAI Platform](https://platform.openai.com/api-keys)
2. Sign in or create an account
3. Click "Create new secret key"
4. Copy the API key (starts with `sk-`)

### Tavily API Key
1. Go to [Tavily](https://tavily.com/)
2. Sign up for an account
3. Navigate to your dashboard
4. Copy your API key

## 🛠️ Installation & Setup

### Option 1: Quick Start (Recommended)

1. **Clone or navigate to the project directory**:
   ```bash
   cd /path/to/GenAI-app/pydantic-ai-chatbot
   ```

2. **Set up environment variables**:
   ```bash
   # Copy the example environment file
   cp agent/.env.example agent/.env
   
   # Edit the .env file with your API keys
   nano agent/.env  # or use your preferred editor
   ```
   
   Update the `.env` file:
   ```env
   OPENAI_API_KEY=sk-your-openai-api-key-here
   TAVILY_API_KEY=your-tavily-api-key-here
   AGENT_HOST=0.0.0.0
   AGENT_PORT=8000
   ```

3. **Start everything with one command**:
   ```bash
   ./start-all.sh
   ```

4. **Access the application**:
   - Frontend: http://localhost:3000
   - Agent API: http://localhost:8000

### Option 2: Manual Setup

#### Backend Setup (Pydantic AI Agent)

1. **Navigate to the agent directory**:
   ```bash
   cd agent
   ```

2. **Create and activate a virtual environment**:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your API keys
   ```

5. **Start the agent**:
   ```bash
   python agent.py
   ```

#### Frontend Setup (Next.js + CopilotKit)

1. **Open a new terminal and navigate to frontend directory**:
   ```bash
   cd frontend
   ```

2. **Install Node.js dependencies**:
   ```bash
   npm install
   ```

3. **Start the development server**:
   ```bash
   npm run dev
   ```

## 🎯 Usage

Once both services are running:

1. **Open your browser** and go to http://localhost:3000
2. **Start chatting** with the AI assistant using the sidebar
3. **Ask questions** that require current information, such as:
   - "What's the latest news about AI developments?"
   - "Find me recent research papers on climate change"
   - "What's the current weather in Tokyo?"
   - "Search for the best restaurants in New York City"

### Example Interactions

**User**: "What are the latest developments in quantum computing?"

**AI**: *[Activates tavily_search tool]* Let me search for the latest information on quantum computing developments...

*[Returns with current articles, research papers, and news about quantum computing]*

## 🔧 Configuration

### Environment Variables

#### Agent (.env)
```env
# Required API Keys
OPENAI_API_KEY=sk-your-openai-key
TAVILY_API_KEY=your-tavily-key

# Server Configuration
AGENT_HOST=0.0.0.0
AGENT_PORT=8000
```

#### Frontend (.env.local)
```env
# Agent Connection
AGENT_URL=http://localhost:8000/
```

### Customizing the Agent

You can modify the agent's behavior by editing `agent/agent.py`:

- **Change the system prompt** to adjust the agent's personality
- **Modify search parameters** in the `tavily_search` tool
- **Add new tools** by creating new functions with the `@agent.tool_plain` decorator

### Customizing the UI

The frontend can be customized by editing:
- `frontend/src/app/page.tsx` - Main page layout and content
- `frontend/src/app/globals.css` - Styling and themes
- `frontend/src/app/layout.tsx` - App layout and CopilotKit configuration

## 🐛 Troubleshooting

### Common Issues

1. **"Import pydantic_ai could not be resolved"**
   - Make sure you've activated the virtual environment
   - Run `pip install -r requirements.txt`

2. **"Cannot find module @copilotkit/react-core"**
   - Make sure you're in the frontend directory
   - Run `npm install`

3. **Agent not connecting to frontend**
   - Check that the agent is running on port 8000
   - Verify the `AGENT_URL` in frontend/.env.local
   - Ensure no firewall is blocking the connections

4. **API Key errors**
   - Verify your API keys are correctly set in the .env file
   - Make sure there are no extra spaces or quotes around the keys
   - Check that your API keys are valid and have the necessary permissions

### Logs and Debugging

- **Agent logs**: Check the terminal where you started the agent
- **Frontend logs**: Check the browser console (F12)
- **Network issues**: Verify both services are running and accessible

## 📁 Project Structure

```
pydantic-ai-chatbot/
├── agent/                      # Python Pydantic AI agent
│   ├── agent.py               # Main agent implementation
│   ├── requirements.txt       # Python dependencies
│   ├── .env.example          # Environment template
│   └── start-agent.sh        # Agent startup script
├── frontend/                  # Next.js frontend
│   ├── src/
│   │   ├── app/
│   │   │   ├── api/copilotkit/
│   │   │   │   └── route.ts   # CopilotKit runtime API
│   │   │   ├── globals.css    # Global styles
│   │   │   ├── layout.tsx     # App layout
│   │   │   └── page.tsx       # Main page
│   ├── package.json           # Node.js dependencies
│   ├── next.config.js         # Next.js configuration
│   ├── tailwind.config.js     # Tailwind CSS config
│   ├── .env.local            # Frontend environment
│   └── start-frontend.sh     # Frontend startup script
├── start-all.sh              # Start both services
└── README.md                 # This file
```

## 🚀 Deployment

### Development
The application is ready for development use. Both services run locally and communicate via the AG-UI protocol.

### Production
For production deployment:

1. **Agent**: Deploy the Python agent to a cloud service (Heroku, Railway, etc.)
2. **Frontend**: Deploy the Next.js app to Vercel, Netlify, or similar
3. **Environment**: Update `AGENT_URL` in the frontend to point to your deployed agent

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **[Pydantic AI](https://ai.pydantic.dev/)** - Modern Python agent framework
- **[CopilotKit](https://copilotkit.ai/)** - Agentic UI framework
- **[Tavily](https://tavily.com/)** - Web search API
- **[Next.js](https://nextjs.org/)** - React framework
- **[AG-UI Protocol](https://ag-ui.com/)** - Agent-to-UI communication standard

---

**Happy chatting! 🤖✨**