#set page(
  width: 100pt,
  height: 100pt,
  margin: 0pt,
  fill: none,
)

#let logo-color = rgb(200, 100, 200)

#place(
  dx: 0pt,
  dy: 0pt,
  rect(
    width: 100pt,
    height: 100pt,
    fill: logo-color,
    radius: 15pt,
    inset: 0pt,
  )[
    #align(center + horizon)[
      #text(font: "Impact",style:"italic",fill: white, size: 80pt, weight: 200)[
        tc
      ]
    ]
  ]
)
