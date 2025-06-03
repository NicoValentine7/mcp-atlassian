# MCP-Atlassian 使用方法

## 方法1: MCP Inspector で使用

MCP Inspectorは、MCPサーバーをブラウザ上でインタラクティブにテストできるツールです。

### 起動方法
```bash
cd /Users/nico/projects/mcps/mcp-atlassian
./run-mcp-inspector.sh
```

### 使い方
1. ブラウザで http://localhost:5173 を開く
2. 左側のパネルで利用可能なツールを確認
3. ツールを選択して必要なパラメータを入力
4. 実行結果を確認

### 利用可能なツール例
- `confluence_search`: Confluenceでコンテンツを検索
- `confluence_get_page`: ページIDでConfluenceページを取得
- `jira_search_issues`: JiraでIssueを検索
- `jira_get_issue`: Issue IDでJira Issueを取得

## 方法2: Claude Desktop で使用

Claude Desktopに統合されており、会話の中で自然に使用できます。

### 設定確認
設定は既に `/Users/nico/Library/Application Support/Claude/claude_desktop_config.json` に追加済みです。

### 使い方
1. Claude Desktopを再起動
2. 新しい会話を開始
3. 以下のような質問をする：

#### 例1: Confluenceページの取得
```
「Confluence のページID 3344139168 の内容を取得してください」
```

#### 例2: Jira Issue の検索
```
「プロジェクト PROJ の未解決のIssueを検索してください」
```

#### 例3: Confluenceでの検索
```
「Confluence で "課金リプレイス" に関するページを検索してください」
```

### 注意事項
- Claude Desktopでは、MCPサーバーは自動的にバックグラウンドで起動されます
- Dockerが起動している必要があります
- 初回起動時は少し時間がかかる場合があります

## トラブルシューティング

### MCP Inspectorが起動しない場合
```bash
# Dockerが起動しているか確認
docker ps

# npmパッケージを再インストール
npm install -g @modelcontextprotocol/inspector
```

### Claude Desktopで認識されない場合
1. Claude Desktopを完全に終了（Cmd+Q）
2. 再度起動
3. 設定メニューから「Developer」→「Reload」を実行

### 認証エラーが発生する場合
`.env` ファイルのAPIトークンが正しいか確認してください。