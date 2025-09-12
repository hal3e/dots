function xelatex
  docker run --rm -v $PWD:/workdir:z alatex xelatex $argv;
end
