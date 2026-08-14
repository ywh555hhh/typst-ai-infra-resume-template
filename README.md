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

快速打开本地预览：

```bash
make preview
```

也可以监听改动：

```bash
typst watch main.typ output/resume.pdf
```

或者：

```bash
make watch
```

推荐工作流：先运行 `make preview` 打开 PDF，再在另一个终端运行 `make watch`。之后每次保存 `.typ` 文件，Typst 都会自动重新生成 `output/resume.pdf`。macOS 上建议用 Skim 打开 PDF，它会自动刷新；Preview 有时需要重新聚焦或重新打开。

## Typst Web 导入

在 Typst Web App 里选择从 GitHub repository 创建项目，然后使用本仓库地址。入口文件是：

```text
main.typ
```

默认配置不会强行指定字体，因此 Typst Web 不应该出现 `unknown font family` warning。

如果你想在本地使用指定字体，请打开 `main.typ`，取消这行注释：

```typst
// #set text(font: body_fonts)
```

然后在 `theme.typ` 里编辑 `body_fonts`。

## 常见修改

- 改姓名/电话/邮箱/GitHub：编辑 `data.typ`
- 改主题色/字号/页边距：编辑 `theme.typ`
- 改同一 bullet 折行间距：编辑 `theme.typ` 里的 `leading_ratio`
- 改不同 bullet 之间间距：编辑 `theme.typ` 里的 `list_item_spacing_ratio`
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
