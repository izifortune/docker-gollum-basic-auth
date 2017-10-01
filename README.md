Dockerfile to install and start a [gollum](https://github.com/gollum/gollum)
instance.

Inspired by https://github.com/suttang/docker-gollum

This docker container has support for basic auth using `auth.rb` file.
You can pass your own `USERNAME` and `PASSWORD` as environment variables.

## Install

```
docker pull izifortune/docker-gollum-basic-auth
```

## Use

### Run container simply

```
sudo docker run -d -p 80:4567 -e USERNAME=admin -e PASSWORD=admin --name gollum izifortune/docker-gollum-basic-auth
```

admin/admin will be your username and password

### You can attach some options

    sudo docker run -d -P --name gollum izifortune/docker-gollum-basic-auth --allow-uploads --live-preview

To add more options , checkout this link [gollum options](https://github.com/gollum/gollum#running).

### Use wikidata in host filesystem

```
sudo docker run -d -P -v ~/wikidata:/root/wikidata izifortune/docker-gollum-basic-auth
```

