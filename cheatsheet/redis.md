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
