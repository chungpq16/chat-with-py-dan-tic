# Enhanced Pydantic AI Agent with MCP Integration

This agent combines Pydantic AI with Tavily search and configurable MCP (Model Context Protocol) servers for extended functionality.

## Features

### Built-in Tools
- **Tavily Search**: Web search for current information, news, and research

### MCP Integration
- **Configurable MCP Servers**: Load multiple MCP servers via JSON configuration
- **Python Code Execution**: Run Python scripts and calculations
- **Memory Storage**: Remember information across conversations
- **File System Operations**: Read/write files
- **GitHub Integration**: Repository operations (with API key)
- **Database Operations**: PostgreSQL support (with connection string)

## Configuration

### MCP Configuration Files

#### Minimal Configuration (`mcp_config_minimal.json`)
```json
{
  "mcpServers": {
    "python-runner": {
      "command": "uvx",
      "args": ["mcp-run-python", "stdio"],
      "description": "Python code execution server"
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "description": "Memory server for conversations"
    }
  }
}
```

#### Full Configuration (`mcp_config.json`)
Includes additional servers like GitHub, PostgreSQL, and file system operations.

### Environment Variables

Create a `.env` file:
```bash
# Required
OPENAI_API_KEY=your-openai-api-key-here
TAVILY_API_KEY=your-tavily-api-key-here

# Optional MCP integrations
GITHUB_PERSONAL_ACCESS_TOKEN=your-github-token-here
POSTGRES_CONNECTION_STRING=postgresql://user:password@localhost:5432/database
```

## Installation

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

2. Install MCP servers (as needed):
```bash
# Python runner (recommended)
uvx install mcp-run-python

# Memory server
npm install -g @modelcontextprotocol/server-memory

# File system server
npm install -g @modelcontextprotocol/server-filesystem

# GitHub server
npm install -g @modelcontextprotocol/server-github

# PostgreSQL server
npm install -g @modelcontextprotocol/server-postgres
```

## Usage

### Starting the Agent
```bash
python agent.py
```

The agent will:
1. Load environment variables
2. Initialize Tavily search
3. Load MCP servers from configuration
4. Start the server on `http://localhost:8000`

### Available Endpoints
- **Main AG-UI endpoint**: `http://localhost:8000/`
- **Tools list**: `http://localhost:8000/tools`
- **Health check**: `http://localhost:8000/health`

### Logging

The agent provides comprehensive logging:
- **Console output**: Real-time logs
- **File logging**: `agent.log` with detailed information
- **Request tracking**: Each request gets a unique ID
- **Tool call monitoring**: Track which tools are called and their results

### Example Tool Usage

1. **Web Search**: "What are the latest AI developments in 2025?"
2. **Python Execution**: "Calculate the fibonacci sequence for n=10"
3. **Memory Storage**: "Remember that my favorite programming language is Python"
4. **File Operations**: "Save this data to a file called results.txt"

## Configuration Customization

### Adding New MCP Servers

Edit `mcp_config.json` to add new servers:

```json
{
  "mcpServers": {
    "your-custom-server": {
      "command": "your-command",
      "args": ["arg1", "arg2"],
      "description": "Description of your server",
      "env": {
        "CUSTOM_API_KEY": "your-api-key"
      }
    }
  }
}
```

### Switching Configuration Files

The agent tries configurations in this order:
1. `mcp_config_minimal.json` (default)
2. `mcp_config.json` (fallback)
3. No MCP servers (Tavily only)

To use the full configuration by default, modify the `load_mcp_config()` function.

## Troubleshooting

### Common Issues

1. **MCP servers fail to load**
   - Check that required commands (`uvx`, `npx`) are installed
   - Verify MCP server packages are installed globally
   - Check the logs for specific error messages

2. **Tool calls fail**
   - Ensure environment variables are set correctly
   - Check network connectivity for external services
   - Review the detailed logs in `agent.log`

3. **Performance issues**
   - Some MCP servers may be slower than others
   - Consider disabling unused servers in the configuration
   - Monitor logs for tool execution times

### Log Analysis

Check `agent.log` for detailed information:
- Request/response tracking
- Tool call details
- Error messages and stack traces
- Performance metrics

## Development

### Adding Custom Tools

You can add custom tools directly to the agent:

```python
@agent.tool_plain
async def my_custom_tool(param: str) -> str:
    """Your custom tool description"""
    # Implementation here
    return "result"
```

### Extending MCP Integration

To add support for new MCP servers, update the configuration file and ensure the required packages are installed.