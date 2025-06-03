#!/bin/bash
# MCP Inspector launcher for mcp-atlassian

cd "$(dirname "$0")"

echo "Starting MCP Inspector with mcp-atlassian Docker container..."
echo "Open http://localhost:5173 in your browser to interact with the MCP server"
echo ""

npx @modelcontextprotocol/inspector \
  docker run --rm --env-file .env ghcr.io/sooperset/mcp-atlassian:latest