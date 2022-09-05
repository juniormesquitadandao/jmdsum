# JMDSum
JMDSum lets you calculate the unique checksum of a file.

### Setup
- Configure host: https://github.com/juniormesquitadandao/gerlessver

```sh
cd jmdsum
  sh devops/chmod.sh
  ./devops/compose/config.sh
  ./devops/compose/build.sh
  ./devops/compose/up.sh
  ./devops/compose/exec.sh app bash
    ruby app/jmdsum.rb
    ruby app/secrets.rb
    ruby app/files.rb
    exit
  ./devops/compose/down.sh
  ./devops/compose/delete.sh
```