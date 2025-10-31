# Lean 4 Development Environment with DevContainer

[日本語版はこちら / Japanese version](./README.ja.md)

A minimal Lean 4 development environment using VSCode DevContainer. This setup provides a consistent development environment with Lean 4, making it easy to start theorem proving and functional programming.

## Features

- 🐳 **Docker-based**: Consistent development environment using DevContainer
- 🎯 **Minimal Size**: Optimized Dockerfile (~250-300MB) based on debian:bookworm-slim
- 🔧 **Pre-configured**: VSCode extensions and settings ready to use
- 🚀 **Quick Setup**: One-click development environment activation

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Getting Started

1. **Clone this repository**

```bash
git clone https://github.com/chantakan/lean4-devcontainer-template.git
cd lean4-devcontainer-template
```

2. **Open in VSCode**

```bash
code .
```

3. **Reopen in Container**

When VSCode opens, you'll see a notification asking to "Reopen in Container". Click it, or:
- Press `F1` or `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
- Type "Dev Containers: Reopen in Container"
- Press Enter

The first build may take a few minutes. Subsequent opens will be much faster.

4. **Verify Installation**

Once the container is built and running, open the integrated terminal in VSCode and run:

```bash
lean --version
lake --version
```

5. **Run the Example**

```bash
lake build
lake exe lean4-project
```

You should see the output: `Hello, Lean 4!`

## Project Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json    # DevContainer configuration
│   └── Dockerfile            # Docker image definition
├── .gitignore               # Git ignore rules
├── lakefile.lean            # Lake build configuration
├── lean-toolchain           # Lean version specification
├── Main.lean                # Main entry point with examples
└── README.md                # This file
```

## Example Code

The `Main.lean` file includes:
- A simple "Hello, Lean 4!" program
- Proof of commutativity of addition (two approaches)
- Examples using the `omega` tactic

## Building and Running

### Build the Project

```bash
lake build
```

### Run the Executable

```bash
lake exe lean4-project
```

### Update Dependencies

```bash
lake update
```

## Customization

### Change Lean Version

Edit the `lean-toolchain` file to specify a different version:

```
leanprover/lean4:v4.x.x
```

Or use:
```
leanprover/lean4:stable
leanprover/lean4:nightly
```

### Add Dependencies

Edit `lakefile.lean` to add external Lean libraries. For example:

```lean
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
```

Then run `lake update` in the container.

## Troubleshooting

### Container Build Fails

- Ensure Docker is running
- Check your internet connection
- Try rebuilding: `Dev Containers: Rebuild Container`

### Lean Extensions Not Working

- Make sure you opened the folder in the container (check bottom-left corner of VSCode)
- Reload VSCode window: `Developer: Reload Window`

### Out of Memory

If you encounter memory issues during builds:
- Increase Docker's memory allocation in Docker Desktop settings
- Recommended: at least 4GB RAM

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Resources

- [Lean 4 Official Documentation](https://lean-lang.org/documentation/)
- [Theorem Proving in Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/)
- [Lean 4 Community](https://leanprover-community.github.io/)
- [Lake Build System](https://github.com/leanprover/lake)

## Acknowledgments

- [Lean Prover Community](https://leanprover-community.github.io/) for the excellent documentation and tools
- All contributors to the Lean 4 project