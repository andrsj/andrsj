// ── Page & font setup ──────────────────────────────────────────────
#set page(paper: "a4", margin: (x: 36pt, y: 30pt))
#set text(font: "Helvetica Neue", size: 10pt, fill: rgb("333333"))
#set par(leading: 0.55em)

// ── Colors ─────────────────────────────────────────────────────────
#let accent = rgb("0097a7")
#let heading-color = rgb("222222")
#let light-text = rgb("555555")

// ── Helper components ──────────────────────────────────────────────
#let section-heading(title) = {
  block(breakable: false)[
    #v(6pt)
    #text(size: 12pt, weight: "bold", fill: heading-color, title)
    #v(-3pt)
    #line(length: 100%, stroke: 0.5pt + accent)
    #v(2pt)
  ]
}

#let experience-entry(role, dates, location, summary, bullets, tech: none) = {
  block(breakable: true)[
    #v(2pt)
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 10.5pt, role), text(size: 9pt, fill: light-text, dates),
    )
    #text(size: 9pt, style: "italic", fill: light-text, location)
    #v(1pt)
    #text(size: 9.2pt, summary)
    #v(1pt)
    #text(size: 9pt, bullets)
    #if tech != none {
      text(size: 8.5pt, fill: light-text)[*Tech:* #text(style: "italic", tech)]
    }
    #v(2pt)
  ]
}

#let contact-link(url, label) = {
  link(url)[#text(fill: accent)[#underline(label)]]
}

// ── Header ─────────────────────────────────────────────────────────
#grid(
  columns: (1fr, auto),
  [
    #text(size: 24pt, weight: "bold", fill: heading-color)[Andrii Derkach] \
    #text(size: 13pt, fill: accent)[Go & Python Backend Developer]
  ],
  align(right)[#text(size: 9pt, fill: light-text)[
    +38 (096) 26 84 768 \
    Lviv, Ukraine \
    #contact-link("mailto:andrsj.derkach@gmail.com")[andrsj.derkach\@gmail.com]
  ]]
)

#v(4pt)
#text(size: 9pt, fill: light-text)[
  #contact-link("https://t.me/andrsj")[Telegram] | #contact-link("https://github.com/andrsj")[GitHub] | #contact-link("https://www.linkedin.com/in/andrsj-derkach")[LinkedIn] | English: Upper Intermediate
]

// ── Summary ────────────────────────────────────────────────────────
#v(4pt)
#text(size: 9.5pt, fill: light-text)[
  Go/Python backend engineer with 4+ years of experience in microservices and distributed systems.  Specialized in Go, SQL/NoSQL (Spanner, PostGIS), and event-driven architectures (Kafka/Redpanda). 
  Expert in AI-assisted development (Claude Code) and system performance optimization.]

// ── Skills ──────────────────────────────────────────────────────────
#section-heading("Technical Skills")
#text(size: 9pt)[
  - *Languages:* Go (Echo, Gin, gRPC), Python (FastAPI, Scrapy), TS/JS (React). 
  - *Storage & Messaging:* Spanner, PostgreSQL/PostGIS, MongoDB, Redis, Kafka, Redpanda, OpenSearch.
  - *Infra & AI:* GCP, K8s, Docker, CI/CD, Ansible, Claude Code, GitHub Copilot.
]

// ── Experience ──────────────────────────────────────────────────────
#section-heading("Experience")

#experience-entry(
  "Golang Developer | Cherrytrader", "June 2025 – Present", "Remote",
  [Cloud-based truck trading platform with high-load tracking and analytics.],
  [
    - Orchestrated 12 Go microservices across dev/staging/prod using gRPC and REST.
    - Reduced Cloud Spanner costs by *\~28%* by optimizing database editions and usage.
    - Led integration of 1,000+ listings, building high-performance data pipelines.
    - Implemented real-time call tracking using Twilio and virtual proxy numbers.
    - Integrated Claude Code to accelerate delivery and catch architectural issues early.
  ],
  tech: [GCP, Spanner, K8s, Echo, gRPC, Twilio, Claude Code]
)

#experience-entry(
  "Golang Developer | AerLogics", "Apr 2025 – June 2025", "Remote",
  [Aviation telemetry platform with real-time streaming and safety analysis.],
  [
    - Built event-driven services (Go, gRPC) processing aircraft telemetry via Kafka/Redpanda.
    - Designed a shared Go library with CQRS decorators and Kafka producer/consumer abstractions.
    - Integrated geospatial flight-path matching using PostGIS and METAR/TFR data.
    - Automated aviation data ingestion and validation with Python, reducing onboarding time.
  ],
  tech: [Go, Kafka/Redpanda, PostgreSQL/PostGIS, OpenSearch, gRPC]
)

#experience-entry(
  "Golang Developer | KiraNetwork", "Feb 2023 – May 2024", "Remote",
  [Blockchain automation and verifiable cloud computing network.],
  [
    - Developed a DevOps tool for container orchestration using Go Docker SDK and Unix Sockets.
    - Reduced Docker image sizes from *7 GB to \~100 MB* through separation of concerns.
    - Built a CLI tool for node lifecycle management, monitoring, and failure recovery.
  ],
  tech: [Go, Docker SDK, Unix Sockets, Ansible, CI/CD]
)

#experience-entry(
  "Junior Golang Developer | Luxoft", "Feb 2022 – March 2023", "Remote",
  [Microservice-based SaaS platform for dental practice management.],
  [
    - Developed backend microservices for a 20+ service ecosystem using gRPC and REST.
    - Decoupled workflows into async pipelines via Kafka/RabbitMQ, increasing resilience.
    - Optimized slow SQL/NoSQL queries to resolve production timeout incidents.
  ],
  tech: [Go, Gin/Echo, Kafka, PostgreSQL, MongoDB, K8s]
)

// ── Education ───────────────────────────────────────────────────────
#v(4pt)
#line(length: 100%, stroke: 0.3pt + rgb("cccccc"))
#v(2pt)
#text(size: 9pt)[
  *Education:* Master of CS, Ivan Franko National University of Lviv (2021–2022) | Bachelor of CS (2017–2021)
]

