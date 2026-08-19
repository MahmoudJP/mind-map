# Project Status

Last reviewed: 2026-08-20

- GitHub repository: `MahmoudJP/mind-map`
- Repository visibility: Public
- Local Git branch: `main`
- Type: Offline static personal mind-map website
- The Bash build completed successfully through Git Bash on Windows.
- User-created map data stays in browser localStorage and must not be committed.
- Public-source secrets scan passed.
- The private Studio streams the latest public `main` files through an
  owner-authenticated, no-store route. The route stays same-origin with Studio,
  preserving its private Redis-backed synchronization while future GitHub
  pushes appear without copying a new snapshot into the website repository.
