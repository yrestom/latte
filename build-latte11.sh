#! /bin/bash
TAG=$1
export GIT_LATTE_URL=engg.elasticrun.in/platform-foundation/latte.git
export LATTE_BRANCH=${CI_COMMIT_REF_NAME:-develop}
# Uses default frappe and bench master branches from github to build the docker image. Use own URLs to override.
#Temporarily uses docker branch from development project - not from deployment project.
echo "Kafka Config : '${KAFKA_CONFIG}'"
docker build -f Dockerfile --build-arg CUR_DATE=$(date +%Y-%m-%d:%H:%M:%S) --build-arg KAFKA_CONFIG='${KAFKA_CONFIG}' \
  --build-arg LATTE_BRANCH=${LATTE_BRANCH} --build-arg GIT_LATTE_URL=${GIT_LATTE_URL} \
  --add-host=pypi.org:151.101.128.223 --add-host=files.pythonhosted.org:151.101.193.63 \
  -t dock.elasticrun.in/er-latte11-base:${TAG} .
  #--add-host=files.pythonhosted.org:151.101.193.63 \

