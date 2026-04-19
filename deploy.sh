#!/bin/bash

set -e

echo "🚀 Starting deployment..."

# Variables
PROJECT_DIR=~/project_01
IMAGE_NAME=mygameapp:v1
CONTAINER_NAME=myweb
GIT_BRANCH=main

DB_HOST=gamingdb.ce1moeei25cp.us-east-1.rds.amazonaws.com
DB_USER=admin
DB_PASS='Aaditya(on1)'
DB_NAME=appdb

# Go to project folder
cd $PROJECT_DIR

echo "🧹 Resetting local changes..."
git reset --hard

echo "📥 Pulling latest code..."
git pull origin $GIT_BRANCH

echo "🛑 Removing old container..."
sudo docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "🗑️ Removing old image..."
sudo docker rmi -f $IMAGE_NAME 2>/dev/null || true

echo "🔨 Building new image..."
sudo docker build -t $IMAGE_NAME .

echo "🐳 Running new container..."
sudo docker run -d -p 80:80 --name $CONTAINER_NAME \
-e DB_HOST=$DB_HOST \
-e DB_USER=$DB_USER \
-e DB_PASS="$DB_PASS" \
-e DB_NAME=$DB_NAME \
$IMAGE_NAME

echo "✅ Deployment completed!"
echo "🌐 Open Website: http://34.233.121.197"

echo "📌 Running Containers:"
sudo docker ps
