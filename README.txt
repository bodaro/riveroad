# riveroad
River Road Website

## Ski Cabin and Airbnb [Website](http://<user>.users.sonic.net/ "River Road Website")

Github public repo: `git clone https://github.com/bodaro/riveroad.github`
Use markdown converter to make files into html: https://markdowntohtml.com/

#### Install
* Create a user on sonic.net and activate simple website hoisting
  * Goto: https://members.sonic.net/websites/personal_web_hosting/
  * Click activate _Mini Hosting_
* `brew install duck`
* `brew install pandoc`

#### Programs
##### Convert md to html
`cat ski.md | pandoc -f gfm > ski.html`

##### Convert all
`find ./ -iname "*.md" -type f -exec sh -c 'pandoc -f gfm "${0}" -o "./$(basename ${0%.md}.html)"' {} \;`

##### FTP Files to server
Aliases/links: /home/WWW_pages/bodaro or usr/local/lib/WWW_pages/bodaro

`duck -existing overwrite --upload ftps://ftp.sonic.net/home/WWW_pages/<user>/ ~/*.html`
`duck -existing overwrite --upload ftps://ftp.sonic.net/home/WWW_pages/<user>/ ~/*.ico`
`duck -existing overwrite --upload ftps://ftp.sonic.net/home/WWW_pages/<user>/ ~/*.css`

#### Deploy
`./deploy`