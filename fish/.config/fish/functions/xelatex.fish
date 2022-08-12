function xelatex --description 'alias xelatex=docker run --rm -v $PWD:/workdir:z alatex xelatex'
  docker run --rm -v $PWD:/workdir:z alatex xelatex $argv; 
end
