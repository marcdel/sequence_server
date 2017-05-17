# Sequence

## Create Release
* `mix do deps.get, deps.compile`
* `mix release`

## Deploy
Deploy for the first time on a machine.
* `ssh localhost mkdir ~/deploy`
* `scp rel/sequence/releases/0.1.0/sequence.tar.gz localhost:deploy`
* `ssh localhost tar -x -f ~/deploy/sequence.tar.gz -C ~/deploy`
* Start it in a console `ssh -t localhost ~/deploy/bin/sequence console`

## Upgrade
Upgrade the release version of a running deployment.
* `ssh localhost mkdir deploy/releases/0.2.0`
* `scp rel/sequence/releases/0.2.0/sequence.tar.gz localhost:deploy/releases/0.2.0`
* `ssh localhost ~/deploy/bin/sequence upgrade 0.2.0`

## Rollback
Downgrade to a previous version of a running deployment.
* `ssh localhost ~/deploy/bin/sequence downgrade 0.1.0`
