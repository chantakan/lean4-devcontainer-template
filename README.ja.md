# Lean 4 DevContainer 開発環境

[English version](./README.md)

VSCode DevContainerを使用したミニマルなLean 4開発環境です。一貫性のある開発環境を提供し、定理証明や関数型プログラミングを簡単に始めることができます。

## 特徴

- 🐳 **Dockerベース**: DevContainerによる一貫した開発環境
- 🎯 **最小サイズ**: debian:bookworm-slimベースの最適化されたDockerfile (~250-300MB)
- 🔧 **事前設定済み**: VSCode拡張機能と設定がすぐに使える
- 🚀 **クイックセットアップ**: ワンクリックで開発環境を起動

## 必要な環境

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## セットアップ手順

1. **リポジトリのクローン**

```bash
git clone https://github.com/chantakan/lean4-devcontainer-template.git
cd lean4-devcontainer-template
```

2. **VSCodeで開く**

```bash
code .
```

3. **コンテナで再度開く**

VSCodeが開くと、「コンテナーで再度開く」という通知が表示されます。それをクリックするか、以下の手順で開きます:
- `F1`キーまたは`Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac) を押す
- 「Dev Containers: Reopen in Container」と入力
- Enterキーを押す

初回のビルドには数分かかる場合があります。2回目以降はすぐに開きます。

4. **インストールの確認**

コンテナのビルドと起動が完了したら、VSCodeの統合ターミナルを開いて以下を実行します:

```bash
lean --version
lake --version
```

5. **サンプルの実行**

```bash
lake build
lake exe lean4-project
```

`Hello, Lean 4!` と表示されれば成功です。

## プロジェクト構造

```
.
├── .devcontainer/
│   ├── devcontainer.json    # DevContainer設定
│   └── Dockerfile            # Dockerイメージ定義
├── .gitignore               # Git除外ルール
├── lakefile.lean            # Lakeビルド設定
├── lean-toolchain           # Leanバージョン指定
├── Main.lean                # メインエントリポイント(サンプル付き)
└── README.md                # このファイル
```

## サンプルコード

`Main.lean` には以下が含まれています:
- シンプルな「Hello, Lean 4!」プログラム
- 加法の交換法則の証明（2つのアプローチ）
- `omega`タクティックを使用した例

## ビルドと実行

### プロジェクトのビルド

```bash
lake build
```

### 実行可能ファイルの実行

```bash
lake exe lean4-project
```

### 依存関係の更新

```bash
lake update
```

## カスタマイズ

### Leanバージョンの変更

`lean-toolchain` ファイルを編集して、異なるバージョンを指定します:

```
leanprover/lean4:v4.x.x
```

または:
```
leanprover/lean4:stable
leanprover/lean4:nightly
```

### 依存関係の追加

外部のLeanライブラリを追加するには、`lakefile.lean` を編集します。例:

```lean
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
```

その後、コンテナ内で `lake update` を実行します。

## トラブルシューティング

### コンテナのビルドが失敗する

- Dockerが起動していることを確認
- インターネット接続を確認
- 再ビルドを試す: `Dev Containers: Rebuild Container`

### Lean拡張機能が動作しない

- コンテナ内でフォルダを開いているか確認（VSCodeの左下隅を確認）
- VSCodeウィンドウをリロード: `Developer: Reload Window`

### メモリ不足

ビルド中にメモリ不足エラーが発生した場合:
- Docker Desktopの設定でDockerのメモリ割り当てを増やす
- 推奨: 最低4GB以上のRAM

## コントリビューション

コントリビューションを歓迎します！気軽にPull Requestを送ってください。

## ライセンス

このプロジェクトはMITライセンスの下でライセンスされています - 詳細は[LICENSE](LICENSE)ファイルを参照してください。

## リソース

- [Lean 4 公式ドキュメント](https://lean-lang.org/documentation/)
- [Theorem Proving in Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/)
- [Lean 4 コミュニティ](https://leanprover-community.github.io/)
- [Lakeビルドシステム](https://github.com/leanprover/lake)

## 謝辞

- 優れたドキュメントとツールを提供する[Lean Prover Community](https://leanprover-community.github.io/)
- Lean 4プロジェクトのすべてのコントリビューター