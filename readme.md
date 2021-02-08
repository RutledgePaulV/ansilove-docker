A debian docker image containing a pre-compiled version of [ansilove](https://github.com/ansilove/ansilove).

```shell 

echo "Hello!" > myfile.ansi
docker run --rm -v $(pwd):/tmp rutledgepaulv/ansilove sh -c 'ansilove -c400 -o /tmp/myfile.png /tmp/myfile.ansi'
open myfile.png

```