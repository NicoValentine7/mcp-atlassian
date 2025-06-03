#!/bin/bash
# MCP-Atlassian動作確認スクリプト

echo "=== MCP-Atlassian 動作確認 ==="
echo ""

# Dockerの確認
echo "1. Docker状態確認..."
if docker info > /dev/null 2>&1; then
    echo "✅ Dockerは起動しています"
else
    echo "❌ Dockerが起動していません。Dockerを起動してください。"
    exit 1
fi

# 環境変数の確認
echo ""
echo "2. 設定ファイル確認..."
if [ -f ".env" ]; then
    echo "✅ .envファイルが存在します"
    if grep -q "JIRA_USERNAME=" .env && grep -q "JIRA_API_TOKEN=" .env; then
        echo "✅ 認証情報が設定されています"
    else
        echo "❌ 認証情報が不完全です"
    fi
else
    echo "❌ .envファイルが見つかりません"
    exit 1
fi

# MCPサーバーのテスト起動
echo ""
echo "3. MCPサーバーテスト起動..."
echo "（5秒後に自動的に停止します）"
timeout 5 docker run --rm --env-file .env ghcr.io/sooperset/mcp-atlassian:latest --transport stdio 2>&1 | grep -E "(INFO|ERROR)"

echo ""
echo "=== テスト完了 ==="
echo ""
echo "使用方法："
echo "- MCP Inspector: ./run-mcp-inspector.sh"
echo "- Claude Desktop: アプリを再起動して使用可能"