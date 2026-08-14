# Fully Controlled Typst Resume Template

这是一个不依赖外部简历模板的 Typst 简历项目。所有组件都在本地定义，方便完全控制排版、内容和多版本投递。

This repository contains only placeholder resume content. Replace all sample identity, education, internship, project, and contact fields before using it.

## 目录

```text
typst-resume-template/
  main.typ                 # 编译入口
  theme.typ                # 颜色、字号、间距、字体
  data.typ                 # 姓名、联系方式、求职定位
  components.typ           # header、section、entry、skill_line 等组件
  content/
    ai-infra.typ           # AI Infra 方向内容
  output/                  # 编译输出
```

## 编译

```bash
typst compile main.typ output/resume.pdf
```

或者：

```bash
make build
```

也可以监听改动：

```bash
typst watch main.typ output/resume.pdf
```

或者：

```bash
make watch
```

## Typst Web 导入

在 Typst Web App 里选择从 GitHub repository 创建项目，然后使用本仓库地址。入口文件是：

```text
main.typ
```

如果网页版提示缺少 macOS 字体，请打开 `theme.typ`，把 `body_fonts` 改成 Typst Web 可用的中文字体，例如：

```typst
#let body_fonts = (
  "Noto Sans CJK SC",
  "Noto Serif CJK SC",
)
```

## 常见修改

- 改姓名/电话/邮箱/GitHub：编辑 `data.typ`
- 改主题色/字号/页边距：编辑 `theme.typ`
- 改 header/经历条目样式：编辑 `components.typ`
- 改简历正文：编辑 `content/ai-infra.typ`

## 新增一个投递版本

复制一份内容文件：

```bash
cp content/ai-infra.typ content/cuda-kernel.typ
```

然后在 `main.typ` 里把：

```typst
#import "content/ai-infra.typ": resume_content
```

改成：

```typst
#import "content/cuda-kernel.typ": resume_content
```
