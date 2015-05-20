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

p/s: We are using [Powder](pow.cx/manual.html) for our development environment

```bash
kakitube.dev
```

## API

If you giving the correct API Key, when run

```curl
curl -X GET -H "Access-Token: YourSecureRandomApiKey" http://kakitube.dev/api/v1/tv-series/scrubs-672264c6-a652-4ee7-b1ad-57642676bd52 -I
```

you will get

```bash
HTTP/1.1 200 OK
```

IF NOT

```bash
HTTP/1.1 401 Unauthorized
```