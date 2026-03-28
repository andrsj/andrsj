// ── Page & font setup ──────────────────────────────────────────────
#set page(paper: "a4", margin: (x: 36pt, y: 30pt))
#set text(font: "Helvetica Neue", size: 10pt, fill: rgb("333333"))
#set par(leading: 0.6em)

// ── Colors ─────────────────────────────────────────────────────────
#let accent = rgb("0097a7")
#let heading-color = rgb("222222")
#let light-text = rgb("555555")

// ── Helper components ──────────────────────────────────────────────
#let section-heading(title) = {
  block(breakable: false, sticky: true)[
    #v(10pt)
    #text(size: 14pt, weight: "bold", fill: heading-color, title)
    #v(-2pt)
    #line(length: 100%, stroke: 0.5pt + accent)
    #v(4pt)
  ]
}

#let experience-entry(role, dates, location, summary, bullets, tech: none) = {
  block(breakable: true)[
    #v(6pt)
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 10.5pt, role), text(size: 9pt, fill: light-text, dates),
    )
    #text(size: 9pt, style: "italic", fill: light-text, location)
    #v(3pt)
    #text(size: 9.5pt, summary)
    #v(2pt)
    #text(size: 9pt, bullets)
    #if tech != none {
      v(2pt)
      text(size: 8.5pt, fill: light-text)[*Technologies:* \ #text(style: "italic", tech)]
    }
    #v(6pt)
  ]
}

#let contact-link(url, label) = {
  link(url)[#text(fill: accent)[#underline(label)]]
}

// ── Header ─────────────────────────────────────────────────────────
#text(size: 28pt, weight: "bold", fill: heading-color)[Andrii Derkach]
#v(-4pt)
#text(size: 14pt, fill: accent)[Go & Python Backend Developer]
#v(6pt)

// ── Contact row ────────────────────────────────────────────────────
#text(size: 9pt, fill: light-text)[
  +38 (096) 26 84 768 #h(8pt) | #h(8pt)
  Lviv, Ukraine #h(8pt) | #h(8pt)
  #contact-link("mailto:andrsj.derkach@gmail.com")[andrsj.derkach\@gmail.com] #h(8pt) | #h(8pt)
  #contact-link("https://t.me/andrsj")[Telegram] #h(8pt) | #h(8pt)
  #contact-link("https://github.com/andrsj")[GitHub] #h(8pt) | #h(8pt)
  #contact-link("https://gitlab.com/andrsj")[GitLab] #h(8pt) | #h(8pt)
  #contact-link("https://www.linkedin.com/in/andrsj-derkach")[LinkedIn]
]
#v(2pt)

// ── Summary ────────────────────────────────────────────────────────
#text(size: 9.5pt, fill: light-text)[
  Go/Python backend engineer with 4+ years of experience building microservices,
  automation tools and distributed systems. Strong in Go backend, SQL and NoSQL databases,
  REST/gRPC APIs, and containerization with Docker/k8s, Kafka & analogs and ElasticSearch/OpenSearch engines.
  Experienced in cloud platforms, data pipelines and performance optimisation.
  Python for data analysis, web scraping, and automation scripting.
]

// ── Languages ───────────────────────────────────────────────────────
#text(size: 9.5pt, fill: light-text)[*Languages:* Ukrainian (Native), English (Upper Intermediate)]

// ── Skills ──────────────────────────────────────────────────────────
#section-heading("Skills")

#text(size: 9.5pt)[
  - *Languages & Core:* Go (Echo, Gin, Chi, Fiber, gRPC), Python (FastAPI, Scrapy, Selenium), TS/JS (React)
  - *Storage & Messaging:* Spanner, PostgreSQL, MySQL, MongoDB, Redis, ElasticSearch, Kafka, RabbitMQ, Redpanda
  - *Infra & Tools:* GCP, AWS (basics), k8s, Docker, CI/CD, Ansible, Bash
  - *AI-Assisted Dev:* Claude Code, ChatGPT, Gemini, GitHub Copilot
  - *Process:* Agile/Scrum, JIRA, Confluence, Linear
]

// ── Experience ──────────────────────────────────────────────────────
#section-heading("Experience")

#experience-entry(
  "Golang developer at Cherrytrader",
  "June 2025 – Present",
  "Remote",
  [Cloud-based trading platform for American trucks with analytics and tracking system.],
  [
    - Developed and maintained 12 Go microservices across 3 environments (dev/staging/prod)
    - Designed and maintained REST/gRPC APIs and data processing services backed by 10 Spanner databases
    - Led integration of a large client (up to 1,000 listings), building custom data pipelines and performance optimizations
    - Improved performance and stability of production services; resolved production incidents within 30 min – 4 hours
    - Implemented tracking and statistics features for sellers and buyers, including Twilio-based call tracking with virtual proxy numbers (call records and metadata)
    - Reduced Spanner costs by ~28% on dev/staging by migrating from Enterprise Plus to Standard edition
    - Managed and updated production k8s cluster on GCP
    - Conducted code reviews including tech lead's code, catching architectural issues before production
    - Leveraged AI-assisted development (Claude Code) to accelerate delivery and improve code quality
  ],
  tech: [GCP, Spanner, k8s, Google API Gateway, Google Cloud Storage, Vercel \ Go, Echo, squirrel, zog, go-validator, golangci-lint, Gocolly, React \ Python (data analysis, scripting) \ Zenrows, Selenium, Twilio, Sendgrid, Claude Code],
)

#experience-entry(
  "Golang developer at AerLogics",
  "Apr 2025 – June 2025",
  "Remote",
  [Aviation flight tracking & pilot logbook platform with real-time data pipelines and safety analysis.],
  [
    - Built event-driven microservices (Go, gRPC, Protobuf) as part of a 5-service architecture with Kafka/Redpanda streaming pipelines processing real-time aircraft telemetry
    - Owned a data ingestion service consuming from 1 of 7 external aviation data sources via Kafka/Redpanda pipeline
    - Designed shared Go library with CQRS decorators, Kafka consumer/producer abstractions, and structured logging
    - Deployed containerized infrastructure with PostgreSQL/PostGIS (including DB triggers), OpenSearch, Redis, Redpanda, Grafana/Prometheus
    - Integrated aeronautical advisory processing (METAR, NOTAM, TFR) with geospatial flight-path matching
    - Automated field mapping and data validation with Python, accelerating onboarding of new aviation data sources
  ],
  tech: [Docker, PostgreSQL/PostGIS, OpenSearch, Redis, Kafka/Redpanda \ Go, gRPC/Protobuf, GORM, ozzo-validation, migrate, goose, golangci-lint, React/TypeScript \ Python (data analysis, scripting) \ AirNav Systems, RadarBox, FAA data sources],
)

#experience-entry(
  "Golang developer at KiraNetwork",
  "Feb 2023 – May 2024",
  "Remote",
  [Blockchain automation platform — distributed, verifiable cloud computing network for managing blockchain nodes on clients' servers.],
  [
    - Designed and developed a DevOps automation tool for orchestrating containers for blockchain nodes using Golang Docker SDK and Unix sockets
    - Implemented containerized environments to simplify node deployment and lifecycle management
    - Developed a CLI tool for node control, including setup, monitoring, and failure recovery
    - Reduced Docker images from 7 GB to ~100 MB each by applying separation of concerns
    - Mentored a junior developer, enabling them to contribute independently within 2 months
  ],
  tech: [Docker, Docker Compose, QEMU, Ansible, Unix Sockets, GitHub Actions, CI/CD \ Go, Gorilla Web Kit, golangci-lint, Bash],
)

#experience-entry(
  "Golang Jn developer at Luxoft",
  "Feb 2022 – March 2023",
  "Remote",
  [Cloud-Based Dental Management SaaS Platform built on microservice architecture.],
  [
    - Developed backend microservices as part of a 20+ service dental SaaS platform
    - Designed RESTful APIs (Gin, Echo, Chi) serving multiple frontend clients
    - Built gRPC endpoints for inter-service communication, reducing response latency
    - Decoupled synchronous workflows into async pipelines via Kafka/RabbitMQ, improving system resilience
    - Identified and resolved slow queries in PostgreSQL and MongoDB causing production timeouts
    - Assisted junior developers with problem-solving and conducted code reviews
  ],
  tech: [Docker, k8s, CI/CD, REST, gRPC, Redis, Kafka, RabbitMQ, PostgreSQL, MongoDB \ Go, Gin, Echo, Chi, GORM, Testify, pgx, ozzo-validation, migrate, goose, golangci-lint],
)

#experience-entry(
  "Internship at Cursor.Education",
  "Apr 2020 – Oct 2021",
  "Lviv",
  [Automation projects with 3rd party APIs — rating system for a gaming community and Discord bot for user management.],
  [
    - Built automated rating system with player performance tracking via Google Sheets API
    - Developed a Discord bot for user management, moderation, and data storage
  ],
  tech: [Docker, PostgreSQL \ Python, SQLAlchemy, Alembic \ Google API, Telegram API, Discord API],
)

// ── Education ───────────────────────────────────────────────────────
#section-heading("Education")

#grid(
  columns: (1fr, auto),
  [#text(weight: "bold", size: 10pt)[Bachelor's degree, Computer Science]
    #v(-2pt)
    #text(size: 9pt, fill: light-text)[The Ivan Franko National University of Lviv]
    #v(-1pt)
    #text(
      size: 8.5pt,
      style: "italic",
      fill: light-text,
    )[Web development, statistics, ML, data analytics, clustering, Linux administration]],
  text(size: 9pt, fill: light-text)[Sep 2017 – June 2021],
)
#v(4pt)
#grid(
  columns: (1fr, auto),
  [#text(weight: "bold", size: 10pt)[Master's degree, Computer Science]
    #v(-2pt)
    #text(size: 9pt, fill: light-text)[The Ivan Franko National University of Lviv]
    #v(-1pt)
    #text(
      size: 8.5pt,
      style: "italic",
      fill: light-text,
    )[Distributed systems, containerization (Docker, k8s), ML, data analytics, statistics, Linux administration]],
  text(size: 9pt, fill: light-text)[Sep 2021 – Dec 2022],
)

