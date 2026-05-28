# ECUTbeamer

**东华理工大学 Beamer 幻灯片模板**

基于 LaTeX Beamer 的东华理工大学幻灯片模板，支持学院 Logo 自动切换、学校水印、中文排版、TikZ 绘图、参考文献引用等常用功能。

---

## 项目结构

```
├── main.tex          # 主文档（个人信息 + 章节 + 正文）
├── ECUTbeamer.cls    # 模板类文件（主题、Logo、水印、导航等）
├── refs.bib          # BibTeX 参考文献数据库
├── logo/             # 学校及各学院 Logo 图片
│   ├── ECUT.pdf
│   ├── ECUT_logo.pdf
│   ├── 学校.png
│   ├── 地科学院.png
│   ├── 理学院.png
│   ├── 土建学院.png
│   └── 智造学院.png
└── README.md
```

---

## 快速开始

### 1. 编译方式

使用 **XeLaTeX** 编译，推荐编译命令：

```bash
xelatex main.tex
bibtex  main
xelatex main.tex
xelatex main.tex
```

或在 Overleaf 等在线平台中，将编译器设为 **XeLaTeX**，直接编译即可。

### 2. 个人信息填写

打开 `main.tex`，修改导言区的个人信息：

```latex
\logo{理学院}                                    % 选择学院（见下方说明）
\title[基于 LaTeX 的幻灯片设计]{}
\subtitle{\Large 基于 LaTeX 的幻灯片设计}
\institute[]{\normalsize 理学院}
\author[XX]{汇报人：XX\\指导教师：XX}
\date{XX}
```

### 3. 学院 Logo 切换

使用 `\logo{学院名称}` 命令即可切换：

```latex
\logo{理学院}      % 使用 logo/理学院.png
\logo{土建学院}    % 使用 logo/土建学院.png
\logo{学校}        % 使用 logo/学校.png
```

当前支持的学院（对应 `logo/` 目录中的文件）：
- `学校`
- `地科学院`
- `理学院`
- `土建学院`
- `智造学院`

如需新增学院，只需将 Logo 图片放入 `logo/` 文件夹，命名为 `学院名称.png`（或 `.jpg`、`.pdf`），然后在导言区写 `\logo{学院名称}` 即可。若找不到对应文件，自动回退使用 `logo/学校.png`。

---

## 模板功能特性

| 特性 | 说明 |
|------|------|
| 🎨 **主题** | Frankfurt 主题 + infolines 底部导航 |
| 📐 **比例** | 16:9 宽屏，适配现代投影 |
| 🇨🇳 **中文支持** | 基于 `ctexcap` + `xeCJK`，使用楷书等中文字体 |
| 🏷️ **学院 Logo** | 自动嵌入页眉右上角 |
| 💧 **学校水印** | 封面居中水印、正文右侧水印、末页居中水印 |
| 📐 **公式** | 加载 `unicode-math`、`amsmath`，支持行内/行间公式 |
| 📊 **表格** | 支持三线表（`booktabs`） |
| 🖼️ **图片** | 单张/多图排版示例 |
| ✏️ **TikZ 绘图** | 流程图、坐标图等（已加载 `pgfplots`） |
| 🧪 **化学式** | 支持 `mhchem`、`chemfig` |
| 📝 **代码高亮** | 基于 `listings`，已预设配色风格 |
| 📖 **参考文献** | 使用 `gbt7714` 国标格式 |
| 🧭 **导航** | 顶部显示当前章节导航，右下角有页面导航按钮 |

---

## 命令参考

### 内置封面与目录

```latex
\ECUTTitleFrame        % 标题页
\ECUTOutlineFrame      % 目录页
\ECUTThanksFrame[感谢] % 致谢页（可选参数，默认为"谢谢观看！"）
```

### 正文结构

```latex
\section{章节名称}          % 新增导航栏栏目

\begin{frame}{页面标题}     % 新增一页
  正文内容
\end{frame}
```

### 常用环境

```latex
% 列表
\begin{itemize} ... \end{itemize}
\begin{enumerate} ... \end{enumerate}

% 区块
\begin{block}{标题} ... \end{block}
\begin{exampleblock}{标题} ... \end{exampleblock}
\begin{alertblock}{标题} ... \end{alertblock}

% 分栏
\begin{columns}[T,totalwidth=\textwidth]
  \begin{column}{0.48\textwidth} ... \end{column}
  \begin{column}{0.48\textwidth} ... \end{column}
\end{columns}
```

---

## 自定义颜色

模板预定义了以下颜色（在 `ECUTbeamer.cls` 中定义）：

| 颜色名 | RGB | 用途 |
|--------|-----|------|
| `UniBlue` | (26,64,137) | 主题主色 |
| `UniBluetwo` | (8,46,120) | 页眉/页脚底色 |
| `UniOrange` | (212,69,0) | 强调色 |
| `UniRed` | (124,35,62) | 红色强调 |
| `UniGray` | (62,61,60) | 灰色（注释等） |

可在导言区通过 `\color` 或 `\setbeamercolor` 覆盖。

---

## 许可协议

本项目采用 **MIT License** 开源。详见 `ECUTbeamer.cls` 文件头部声明。

---

## 致谢

感谢周成、胡仕琦、姜钦超以及其他为此模板做出帮助的同学！

---

*East China University of Technology — Beamer Template*
