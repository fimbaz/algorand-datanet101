docker tag $(docker build ./ | tail -n1 | cut -d ' ' -f3) fimbaz/algorand-datanet101:latest && docker push fimbaz/algorand-datanet101:latest
