#!/bin/bash

#Creates a new project folder with README, .gitignore and a git repo

if [ -z "$1" ]; then
	echo "Usage: bash newproject.sh <project-name>"
	exit 1
fi

name="$1"

if [ -e "$name" ]; then
	echo "Error: '$name' already exists"
	exit 1
fi

read -p "One-line description: " description
read -p "Your name: " author

mkdir -p "$name/src"
cd "$name" || exit 1

cat > README.md << EOF
# $name

$description

## Author 

$author

## Created

$(date +%Y-%m-%d)
EOF

cat > .gitignore << 'EOF'
node_modules/
*.log
.env
EOF

touch src/.gitkeep

git init -q
git branch -M main
git add .
git commit -q -m "Initial commit"

echo "Project '$name' created!"
ls -A