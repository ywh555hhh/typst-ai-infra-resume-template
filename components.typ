#import "theme.typ": *

#let join_content(items, sep: [, ]) = [
  #let n = items.len()
  #for idx in range(n) {
    items.at(idx)
    if idx + 1 < n { sep }
  }
]

#let resume_header(
  name: "",
  headline: (),
  contacts: (),
) = [
  #align(center)[
    #text(size: name_size, weight: "bold", fill: accent)[#name]

    #v(0.18em)

    #text(size: base_size, fill: text_color)[
      #join_content(headline, sep: [#h(0.8em) | #h(0.8em)])
    ]

    #v(0.26em)

    #text(size: small_size, fill: muted_color)[
      #join_content(contacts, sep: [#h(0.9em) · #h(0.9em)])
    ]
  ]

  #v(0.33em)
  #line(length: 100%, stroke: header_rule + accent)
  #v(0.42em)
]

// Page wrapper used by #show. It prints the header, then the document body.
#let resume_page(
  name: "",
  headline: (),
  contacts: (),
  body,
) = [
  #resume_header(
    name: name,
    headline: headline,
    contacts: contacts,
  )

  #body
]

#let section(title, body) = [
  #v(section_before)
  #text(size: section_size, weight: "bold", fill: accent)[#title]
  #v(0.12em)
  #line(length: 100%, stroke: thin_rule + accent)
  #v(section_after)
  #body
]

#let entry(
  title: "",
  org: "",
  date: "",
  location: "",
  tech: (),
  body,
) = [
  #grid(
    columns: (1fr, auto),
    gutter: 0.8em,
    align: (left, right),
    [
      #text(weight: "bold")[#title]
      #if org != "" [
        #text(fill: muted_color)[ · #org]
      ]
    ],
    [
      #text(size: small_size, fill: muted_color)[#date]
    ],
  )

  #if location != "" or tech.len() > 0 [
    #v(0.05em)
    #text(size: small_size, fill: muted_color)[
      #if location != "" [#location]
      #if location != "" and tech.len() > 0 [#h(0.65em) | #h(0.65em)]
      #if tech.len() > 0 { join_content(tech, sep: [ · ]) }
    ]
  ]

  #v(0.16em)
  #body
  #v(entry_after)
]

#let compact_entry(
  title: "",
  right: "",
  body,
) = [
  #grid(
    columns: (1fr, auto),
    gutter: 0.8em,
    align: (left, right),
    [#text(weight: "bold")[#title]],
    [#text(size: small_size, fill: muted_color)[#right]],
  )
  #v(0.12em)
  #body
  #v(0.32em)
]

#let skill_line(label, items) = [
  #block[
    #text(weight: "bold")[#label]
    #h(0.45em)
    #text(fill: text_color)[#join_content(items, sep: [ · ])]
  ]
]

#let note(text_body) = [
  #text(size: tiny_size, fill: subtle_color)[#text_body]
]
