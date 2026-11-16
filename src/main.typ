#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Realtime Gaussian Splatting XXX],
  abstract: [
    #lorem(50)
  ],
  authors: (
    (
      name: "Paul Menhart",
      department: [Faculty 07 for Computer Science and Mathematics],
      organization: [Munich University of Applied Sciences],
      location: [Munich, Germany],
      email: "menhart@hm.edu",
    ),
  ),
  index-terms: ("Gaussian Splatting", "3DGS"),
  bibliography: bibliography("sources.bib"),
  figure-supplement: [Fig.],
)
#show raw.where(block: true): set text(size: 9pt)



= Introduction

#lorem(500) XXX
// TODO: why real-time splat generation matters; the latency/quality trade-off;
// contribution = an online Learn-Render-Learn loop measured on latency and frame rate,
// with reconstruction quality secondary. 3DGS itself @kerbl_3d_2023 is the starting point.

= Related Work
#lorem(500) XXX

// TODO: 3DGS and its real-time rendering claim; methods for speeding up *training*
// (bounded-budget densification, incremental/SLAM-coupled training, feed-forward
// prediction, foveation). See AGENT.md for the gaps still missing from the bibliography.

= Experimental Setup
#lorem(500) XXX

// TODO: scene capture and COLMAP preprocessing; the offline baseline as calibration;
// the streaming loop and why its PSNR is prequential (frame rendered before it is
// trained on); the variant being ablated; metrics (per-frame latency, FPS, PSNR, SSIM);
// hardware.

= Results
#lorem(500) XXX

// TODO: latency and frame rate first, quality second. PSNR trajectory over the stream,
// not just its range.

= Conclusion
#lorem(500) XXX

// TODO: what the measurements support, the offline-COLMAP idealization as the main
// limitation, next steps.
