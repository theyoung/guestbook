docker build --tag stevenna/guestbook .

dockerpath="stevenna/guestbook"
# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# docker login
echo "user --> $DOCKER_USER"
docker tag stevenna/guestbook:latest $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest