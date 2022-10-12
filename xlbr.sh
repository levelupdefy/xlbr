#! /bin/sh
red='\e[1;31m'
black='\e[1;30m'
green='\e[1;32m'
cayan='\e[1;36m'
yellow='\e[1;33m'
white='\e[1;37m'
reset='\e[1;0m'
while getopts b:c:n: flag;
do
    case "${flag}" in
        b) base=${OPTARG}
        touch index.html
        echo -e "xlbr.sh \nlog \nnode_modules \nremote " > .gitignore
        mkdir src
        echo -e $green
        echo "creating filesystem..."
        echo -e $reset
        cd ./src/
        mkdir frm
        mkdir fnt
        mkdir img
        mkdir pug
        mkdir css
        cd css 
        echo "/*index.css ~ sadhukhanr*/" > index.css
        echo "//index.scss ~ sadhukhanr" > index.scss
        cd ..
        mkdir js
        cd js
        echo "//logic.js ~ sadhukhanr" > logic.js
        cd .. 
        mkdir ng-route
        mkdir json
        cd json
        touch data.json
        cd ..
        cd ..
        mkdir doc
        touch index.html
        touch index.pug
        touch LICENSE
        echo -e $yellow
        echo "git initialization...."
        echo -e $reset
        echo -e $reset
        git init
        git branch -m master main
        echo -e $green
        read -p "github user_name:" x
        read -p "github remote repo_name:" y
        git remote add origin "git@github.com:$x/$y.git"
        echo -e $reset
        git remote -v > remote
        echo -e "# $y \n$x" > README.md
        echo -e $yellow
        echo "node initialization...."
        echo -e $reset
        npm init
        git add .
        git commit -m "creating base system"
        git log > log
        echo "finished!...";;
        c) msgg=${OPTARG}
           echo "making commit..."
           read -p "enter message:" msg
           read -p "branch:" bitch
           git add .
           git commit -m $msg
           rm -rf log
           git log > log
           git push --set-upstream origin $bitch ;;
        n) frem=${OPTARG}
        cd ./src/frm/
        #bootstrap
        if [[ "$frem" == "bootstrap" ]]; then
        echo "installing bootstrap...."
             mkdir bootstrap
             cd bootstrap
             curl https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css > bootstrap.min.css
             curl https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js > bootstrap.min.js
             cd .. 
        fi
        #jquery
        if [[ "$frem" == "jquery" ]]; then
        echo "installing jquery...."
             mkdir jquery
             cd jquery
             curl https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js > jquery.min.js
             cd .. 
        fi
        #tailwind
        if [[ "$frem" == "tailwind" ]]; then
        echo "installing tailwind...."
             mkdir tailwind
             cd tailwind
             curl https://cdn.tailwindcss.com/3.1.8 > tailwind.js
             cd .. 
        fi

        cd .. ;;
    esac
done
