//// Stub. Replaced by a real template later — keep this throwaway.
////
////   nix develop        then  typst watch paper.typ
////   nix build          the PDF from a clean checkout
////   nix fmt            typstyle + nixfmt
//
//#set page(paper: "a4", margin: 2.2cm, numbering: "1")
//#set text(size: 10pt)
//#set par(justify: true)
//#show heading.where(level: 1): it => block(above: 1.4em, below: 0.8em)[#it]
//
//#align(center)[
//  #text(size: 17pt, weight: "bold")[
//    Feasibility of Generating Gaussian Splats in Real Time
//  ]
//
//  #v(0.6em)
//  Paul Menhart \
//  #link("mailto:paul@menhart.net")
//
//  #v(0.4em)
//  GSC-ECAISEVCML27 · Hochschule München FK07
//]
//
//#v(1em)
//
//#align(center)[
//  #block(width: 85%)[
//    *Abstract* --- TODO. Online 3DGS training, what was measured, headline numbers.
//  ]
//]
//
#import "@preview/supercharged-hm:1.1.0": *

#show: hm-template.with(
  title: "Realtime Gaussian Splatting XXX",
  subtitle: [subtitle XXX],
  authors: authors("Paul Menhart"),
  doc-type: "Modularbeit",
  language: "en",
  bibliography: bibliography("sources.bib"),
  toc-depth: 3,
  version: "1",
)

// Quelltextauszüge etwas kleiner setzen, damit die Zeilen nicht umbrechen
#show raw.where(block: true): set text(size: 9pt)


XXX Example table
#align(center)[
  #table(
    columns: 2,
    stroke: none,
    align: (right, left),
    column-gutter: 1em,
    [$(G, w)$],
    [Netzwerk aus einem zusammenhängenden Graphen $G = (V, E)$ und einer
      positiven Gewichtsfunktion $w$],

    [$n = |V|$], [Anzahl der Knoten],
    [$R subset.eq V$], [Menge der Terminalknoten, die der Baum verbinden muss],
    [$r = |R|$], [Anzahl der Terminalknoten],
    [$S = V without R$],
    [Steiner-Knoten: Knoten, die verwendet werden dürfen, aber nicht
      müssen],

    [$S' subset.eq S$], [die jeweils betrachtete Teilmenge der Steiner-Knoten],
    [$w(T)$], [Gewicht einer Kantenmenge $T$, also $sum_(e in T) w(e)$],
  )
]



= Introduction

// TODO: why real-time splat generation matters; the latency/quality trade-off;
// contribution = an online Learn-Render-Learn loop measured on latency and frame rate,
// with reconstruction quality secondary. 3DGS itself @kerbl_3d_2023 is the starting point.

= Related Work

// TODO: 3DGS and its real-time rendering claim; methods for speeding up *training*
// (bounded-budget densification, incremental/SLAM-coupled training, feed-forward
// prediction, foveation). See AGENT.md for the gaps still missing from the bibliography.

= Experimental Setup

// TODO: scene capture and COLMAP preprocessing; the offline baseline as calibration;
// the streaming loop and why its PSNR is prequential (frame rendered before it is
// trained on); the variant being ablated; metrics (per-frame latency, FPS, PSNR, SSIM);
// hardware.

= Results

// TODO: latency and frame rate first, quality second. PSNR trajectory over the stream,
// not just its range.

= Conclusion

// TODO: what the measurements support, the offline-COLMAP idealization as the main
// limitation, next steps.

//#bibliography("Hauptseminar.bib", style: "ieee")

