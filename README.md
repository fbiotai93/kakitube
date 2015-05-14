# KakiTube

Variance of choice to watch Movies & TV Series online

## Make sure, you:-

Start Redis

```bash
redis-server
```

Start Sidekiq

```bash
bundle exec sidekiq
```

Start Sunspot Solr

```bash
bundle exec rake sunspot:solr:start # or sunspot:solr:run to start in foreground
```

ReIndex Object for Sunspot Solr

```bash
bundle exec rake sunspot:reindex # run when needed only
```

p/s: We are using [Pwder](pow.cx/manual.html) for our development environment

```bash
kakitube.dev
```