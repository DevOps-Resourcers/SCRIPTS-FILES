echo "-------------------------------------"
echo "Waiting for Docker cache cleaning..."
echo "-------------------------------------"

# Stop and remove all running containers
docker ps -aq | xargs -r docker stop
docker ps -aq | xargs -r docker rm

# Remove all images
docker images -aq | xargs -r docker rmi -f

# Remove build cache
docker builder prune -af

# Remove unused volumes
docker volume prune -f

# Remove unused networks
docker network prune -f

# Remove dangling images
docker image prune -af

# Remove dangling build cache
docker builder prune -af --filter "dangling=true"

echo "--------------------"
echo "Docker cache removed"
echo "--------------------"
