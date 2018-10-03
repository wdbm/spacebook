![](https://raw.githubusercontent.com/wdbm/spacebook/master/media/spacebook.png)

Tidy images of pages, whiteboards and similar visual representations!

|**original**                                                                          |**processed**                                                                           |
|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
|![](https://raw.githubusercontent.com/wdbm/spacebook/master/media/2013-05-15T2354.png)|![](https://raw.githubusercontent.com/wdbm/spacebook/master/media/2013-05-15T2354_1.png)|

# setup

Install ImageMagick.

```Bash
sudo apt install imagemagick
```

# usage

To convert `image.png` to a tidied `image_1.png`, run the following:

```Bash
./spacebook.sh image.png
```

To convert `a.png` to a tidied `b.png`, run the following:

```Bash
./spacebook.sh a.png b.png
```
