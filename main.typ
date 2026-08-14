// Main entry for the fully controlled resume project.
// Build with: typst compile main.typ output/resume.pdf

#import "theme.typ": *
#import "data.typ": *
#import "components.typ": *
#import "content/ai-infra.typ": resume_content

#set page(
  paper: "a4",
  margin: page_margin,
)

#set text(
  font: body_fonts,
  size: base_size,
  fill: text_color,
  lang: "zh",
  region: "cn",
)

#set par(
  leading: line_leading,
  justify: false,
)

#set list(
  marker: [•],
  indent: 0.75em,
  body-indent: 0.35em,
)

#show link: it => text(fill: accent, underline(it.body))

#show: resume_page.with(
  name: name,
  headline: headline,
  contacts: contacts,
)

#resume_content
