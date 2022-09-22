#! /bin/bash

function create() {
   cd ~/Documents/projects/project_automation
   source venv/bin/activate
   source .env
   python3 create.py $1
   deactivate
   cd $FILEPATH$1
   echo '# '$1 >README.md
   git init
   git add README.md
   git commit -m 'first commit'
   git branch -M master
   git remote add origin git@github.com:$USERNAME/$1.git
   git push -u origin master
#   echo 'launching visual studio code :)'
#   code .
}

function compJava(){
   javaFile="$1.java"
   javaCompiled="$1.class"
   echo "compiling java file"
   javac $javaFile && java $1 && rm $javaCompiled
}
