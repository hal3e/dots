function codex
  docker run --network=host -it --rm -v $(pwd):/app:rw  codex-sandbox codex
end
