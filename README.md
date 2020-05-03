# example for beego

```bash
mkdir gobeeapp
cd gobeeapp

# install beego and its cli
go get github.com/astaxie/beego
go get github.com/beego/bee

bee new .

git init .
git add .
git ci -m "init"

bee run 

beegoapp


godep save
docker build --no-cache -t chienyuan/beegoapp .
docker build -t chienyuan/beegoapp .
docker images chienyuan/beegoapp
docker push chienyuan/beegoapp

docker run --rm -p 8080:8080 chienyuan/beegoapp


```
