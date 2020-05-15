## Getting Started

To get this project running, clone the repository to your machine. 
```
git clone git@github.com:noemi-ashizuka/tokyo-best-coffee-shops.git
```
Then erase the git history and initialize git:
```
rm -rf .git
git init
git add .
git commit -m "initial commit"
```
Then to get the project up and running with seeds:
```
bundle install
rails db:migrate
rails db:seed
```
You will need a Cloudinary key from https://cloudinary.com/ and you can store it in an .env file with the variable name *CLOUDINARY_URL*
