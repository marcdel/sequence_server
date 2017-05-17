# Sequence

## Create Release
* `mix do deps.get, deps.compile`
* `mix release`

## Deploy
* `ssh localhost mkdir ~/deploy`
* `scp rel/sequence/releases/0.1.0/sequence.tar.gz localhost:deploy`
* `ssh localhost tar -x -f ~/deploy/sequence.tar.gz -C ~/deploy`
* Start it in a console `ssh -t localhost ~/deploy/bin/sequence console`
