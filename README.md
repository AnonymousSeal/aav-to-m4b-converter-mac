# aav-to-m4b-converter-mac
aav to m4b converter for one or multiple files

## Prerequisites
In order to run this program you need to install exiftools, a very handy metadata reader and writer. This can be achieved through homebrew with the command:

```$ brew install exiftool```

Next you need to get the audible files. I am assuming at this point, that you already have them and I will go into the details of downloading them at the end of the documentation.

Put the audiobooks into the ```audiobooks/``` folder.

## Activation Bytes and running the program

Now you need to figure out the activation bytes associated with your audible account. [Audible Converter](https://audible-converter.ml/) is a good tool to do this, just upload one of the audiobook files and the website will give you the activation bytes.

Now you need to open the ```converter.sh``` file and towards the top, there is a variable called _activation_bytes_ which is set to an empty string. Put the activation bytes into this string and now you should be able to run the file by executing the command:

```$ bash converter.sh```

## Downloading aav files from Audible

1. Log in to your account on desktop (this is because the web/desktop version still uses the easy to convert aav files, instead of the newer aavc files)
2. Go to Library
3. Scroll through your Library and if you want to download an audiobook click download.

Some issue I encountered when downloading those files, was that they were in mp4 format, but they were actually aav files under the hood - which was revealed by a quick ```$ exiftool filename``` - so I only needed to change the extension from mp4 to aav.
