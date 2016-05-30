Cheatsheet for Redis
========================

## Set
set <key> <value>
```redis
set x 10
```

## Get
get <key>
```redis
set x 10
get x // 10
```

## Increment
incr <key>
```redis
set x 10
incr x
get x // 11
```

## Delete
del <key>
```redis
set x 10
del x // 1
del x // 0
```

## Expiration
expire <key> <duration>
```redis
set x 5
expire x 100 // will expire in 100 seconds
```

## Time Til Deleted
ttl <key>
```redis
set x 5
ttl x // -1 => meaning the key will never expire

expire x 100 // will expire in 100 seconds
// wait 100 seconds
ttl x // -2 => meaning the key does NOT exist
```
