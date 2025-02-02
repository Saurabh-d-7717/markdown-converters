# 🚀 Markdown Conversion Toolkit

**Convert LLM-generated Markdown to DOCX/RTF with One Click!**

## 🎯 Motive
In today's AI-driven workflow, it's common to get assistance from Large Language Models (LLMs) like ChatGPT, Claude, or Gemini for content creation. However, these tools often output text in **Markdown format** by default. When you need to:

- Submit professional documents in Word format
- Share content with non-technical team members
- Use legacy editors that don't support Markdown

...manual conversion becomes tedious. This toolkit solves this problem by providing **instant conversion** of Markdown text (copied from LLMs, editors, or websites) to DOCX/RTF formats through simple click operations.

## 🌟 Key Features
- **Clipboard Magic** - Convert copied Markdown without creating .md files
- **Drag-and-Drop** - Convert existing Markdown files by double-clicking
- **LLM-Optimized** - Perfect for ChatGPT/Gemini/Claude outputs
- **Custom Output** - Choose your preferred save location

## 🫠 Prerequisites
1. **Pandoc**  
   [Download installer](https://pandoc.org/installing.html)  
   *Ensure it's added to system PATH during installation*

2. **Python 3.7+**  
   [Download Python](https://www.python.org/downloads/)  
   *Check "Add Python to PATH" during installation*

3. **Git (Optional)**  
   Required only for cloning repository  
   [Download Git](https://git-scm.com/downloads)

## 🖥 Installation
### 1. Clone Repository
```bash
git clone https://github.com/Saurabh-d-7717/markdown-converters.git
cd markdown-converters
```

### 2. Configure Paths
Edit `config/config.bat` using Notepad/VSCode:
```bat
:: Customize output directory
set "OUTPUT_DIR=C:\Users\YourName\Desktop\ConvertedFiles"

:: Verify Pandoc path (default works if added to PATH)
set "PANDOC_PATH=pandoc"
```

## 🚦 Usage Guide
### Method 1: Clipboard Conversion (Recommended for LLMs)
#### Copy Markdown text from:
- ChatGPT/Gemini/Claude interface
- Markdown editor (VS Code, Obsidian)
- GitHub/GitLab documentation

#### Run Converters:
- **For DOCX:** Double-click `clipboard_to_docx.bat`
- **For RTF:** Double-click `clipboard_to_rtf.bat`

#### Find Output:
Converted files saved to:
`C:\Users\YourName\Desktop\ConvertedFiles`
(or your custom `OUTPUT_DIR`)

### Method 2: File Conversion
#### Associate `.md` Files (One-time setup):
```bash
cd file-converter
associate_files.bat
```
Right-click → Run as Administrator

#### Convert Any `.md` File:
- Double-click the Markdown file
- Automatic conversion to DOCX in `OUTPUT_DIR`

## 🛠 Troubleshooting
| Issue | Solution |
|--------|----------|
| "Pandoc not found" | Reinstall Pandoc and verify PATH |
| Empty output file | Copy text before converting |
| Python errors | Run `python --version` in CMD |
| File association fails | Run `associate_files.bat` as Admin |

## 🤝 Contributing
This project welcomes contributions!

1. Fork the repository
2. Create feature branch: `git checkout -b feature/new-feature`
3. Commit changes: `git commit -m 'Add awesome feature'`
4. Push to branch: `git push origin feature/new-feature`
5. Open Pull Request

## 📚 License
**MIT License** - Free for personal and commercial use  
Copyright (c) 2025 Saurabh-d-7717

