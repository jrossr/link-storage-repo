#!/bin/bash
set -e
mkdir link-storage-repo && cd link-storage-repo
git init

echo "Unzipping basic version..."
unzip ../link_storage_app.zip -d .
git add . && git commit -m "Initial basic version" && git branch basic

echo "Applying auth version..."
rm -rf * && unzip ../link_storage_app_extended.zip -d .
git add . && git commit -m "Add user auth features" && git branch auth

echo "Applying bootstrap version..."
rm -rf * && unzip ../link_storage_app_bootstrap_deploy.zip -d .
git add . && git commit -m "Add Bootstrap UI and deploy setup" && git branch bootstrap

echo "Applying complete version..."
rm -rf * && unzip ../link_storage_app_complete.zip -d .
git add . && git commit -m "Add Docker, nginx, htaccess, SSL guide" && git branch complete

echo "Applying final secure version..."
rm -rf * && unzip ../link_storage_app_final_secure.zip -d .
git add . && git commit -m "Add admin panel, analytics, token API" && git branch final_secure

echo "Creating main branch from final version..."
git checkout -b main
