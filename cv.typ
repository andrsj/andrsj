// ── Page & font setup ──────────────────────────────────────────────
#set page(paper: "a4", margin: 0pt)
#set text(font: "Helvetica Neue", size: 10pt, fill: rgb("333333"))
#set par(leading: 0.6em)

// ── Colors ─────────────────────────────────────────────────────────
#let sidebar-bg = rgb("e8e8e8")
#let accent = rgb("0097a7")
#let heading-color = rgb("222222")
#let light-text = rgb("555555")

// ── Sidebar width ──────────────────────────────────────────────────
#let sidebar-width = 180pt
#let main-inset = 24pt

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

#let sidebar-heading(title) = {
  v(10pt)
  text(size: 11pt, weight: "bold", fill: heading-color, upper(title))
  v(2pt)
}

#let contact-entry(label, body) = {
  block(spacing: 5pt)[#text(fill: accent, label) #body]
}

#let experience-entry(role, dates, location, summary, bullets, tech: none) = {
  block(breakable: false)[
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

// ── Sidebar (fixed, page 1 background) ─────────────────────────────
#place(top + left, rect(
  width: sidebar-width,
  height: 100%,
  fill: sidebar-bg,
  stroke: none,
  inset: (x: 16pt, top: 24pt, bottom: 24pt),
)[
  // ── Contacts ──
  #sidebar-heading("Contacts")

  #contact-entry("Phone:", text(size: 9pt)[+38 (096) 26 84 768])
  #contact-entry("City:", text(size: 9pt)[Lviv, Ukraine])
  #contact-entry("Telegram:", text(size: 9pt)[#link("https://t.me/andrsj")[t.me/andrsj]])
  #contact-entry("E-mail:", text(size: 9pt)[#link("mailto:andrsj.derkach@gmail.com")[andrsj.derkach\@gmail.com]])
  #contact-entry("GitHub:", text(size: 9pt)[#link("https://github.com/andrsj")[github.com/andrsj]])
  #contact-entry("GitLab:", text(size: 9pt)[#link("https://gitlab.com/andrsj")[gitlab.com/andrsj]])
  #contact-entry("LinkedIn:", text(size: 9pt)[#link("https://www.linkedin.com/in/andrsj-derkach")[andrsj-derkach]])

  // ── Languages ──
  #sidebar-heading("Languages")
  #text(size: 9.5pt)[
    - Ukrainian (Native)\
    - English (Upper Intermediate)
  ]

  // ── Interests ──
  #sidebar-heading("Interests")
  #text(size: 9.5pt)[
    - Psychology\
    - Computer architecture\
    - Hard Electronic Music\
    - Game Dev\
    - Game analytics
  ]
])

// ── Main content (flows, respects sidebar via margin) ──────────────
#block(inset: (left: sidebar-width + main-inset, right: main-inset, top: 24pt, bottom: 24pt))[

  // ── Header ──
  #text(size: 28pt, weight: "bold", fill: heading-color)[Andrii Derkach]
  #v(-4pt)
  #text(size: 14pt, fill: accent)[Go & Python Backend Developer]
  #v(6pt)
  #text(size: 9.5pt, fill: light-text)[
    Go/Python backend engineer with 4+ years of experience building microservices,
    automation tools and distributed systems. Strong in Go backend, SQL and NoSQL databases,
    REST/gRPC APIs, and containerization with Docker/k8s, Kafka & analogs and ElasticSearch/OpenSearch engines.
    Experienced in cloud platforms, data pipelines and performance optimisation.
    Python for data analysis, web scraping, and automation scripting.
  ]

  // ── Skills ──
  #section-heading("Skills")

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #text(size: 9.5pt)[
        - *Languages:* Go #text(fill: accent)[★], Python, TS, JS
        - *Databases:* PostgreSQL, MySQL, Spanner, MongoDB, Redis, Memcached
        - *Search:* ElasticSearch, OpenSearch
        - *APIs:* REST, gRPC/Protobuf
      ]
    ],
    [
      #text(size: 9.5pt)[
        - *Infrastructure:* Git, Docker, k8s, CI/CD, Bash, Ansible
        - *Frontend:* JS, React, TS
        - *Messaging:* Kafka, RabbitMQ, Redpanda
        - *Cloud:* GCP, AWS (basics), Vercel
        - *Process:* Agile/Scrum, JIRA, Confluence, Linear
      ]
    ],
  )

  #v(2pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    [
      #text(weight: "bold", size: 9.5pt)[Go ecosystem]
      #v(1pt)
      #text(size: 9pt, style: "italic")[
        Gin, Echo, Chi, Fiber, GORM, Testify,
        golangci-lint, Gocolly, Gorilla Web Kit
      ]
    ],
    [
      #text(weight: "bold", size: 9.5pt)[Python ecosystem]
      #v(1pt)
      #text(size: 9pt, style: "italic")[
        Flask, FastAPI, SQLAlchemy, Alembic,
        PyTest, Scrapy, Selenium, BeautifulSoup
      ]
    ],
  )

  #v(2pt)
  #text(weight: "bold", size: 9.5pt)[AI-assisted development]
  #v(1pt)
  #text(size: 9pt, style: "italic")[
    Anthropic Claude Code, OpenAI ChatGPT + Codex, Google Gemini, GitHub Copilot
  ]

  #v(2pt)
  #text(weight: "bold", size: 9.5pt)[3rd party APIs & services]
  #v(1pt)
  #text(size: 9pt, style: "italic")[
    Telegram API, Discord API, Google API (Sheets, Drive, Docs),
    Twilio, Sendgrid, Zenrows
  ]

  // ── Education ──
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

  // ── Experience ──
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
      - Set up linting and code quality tooling
      - Used Python and Selenium for data analysis, file processing, and database investigation
      - Coordinated across distributed team with DevOps, backend, frontend, iOS, Android, and QA
      - Conducted code reviews including tech lead's code
      - Maintained technical documentation (ApiDog, GitHub docs, PDFs for management and marketing)
      - Task tracking with Linear, time management with Clockify
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
      - Used Python for data analysis, field mapping, and database investigation
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
      - Set up CI/CD rules for linting and formatting
      - Reduced Docker images from 7 GB to ~100 MB each by applying separation of concerns
      - Mentored a junior developer and conducted extensive code reviews
      - Maintained technical documentation in Notion
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
      - Configured linting and formatting standards for the team
      - Experienced in Atlassian tools (JIRA, Confluence)
      - Assisted junior developers with problem-solving and conducted code reviews
      - Maintained onboarding documentation in GitHub repos
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

]
