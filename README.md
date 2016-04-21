## README

### Getting the application up and running

Ruby version 
* Ruby 2.2.3 recommended. Rails 4.2 requires at least 1.9.3, and likes v2 best.

System dependencies:
* ffmpeg transcoding library
* `brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libas`

Run the test suite using Rspec:
* `rspec` or `rake`

### Checklist of Goals

[x] A user needs to be able to upload videos to the web application server

[x] The uploader should only be able to upload the mp4 file types

[x] All other file types should be blocked

[x] After the video has been uploaded, the user should be able to replay this 
video from the web application

[x] It should show a progress bar to the user as they are uploading with the 
percentage completed and the estimated time

[x] As a user uploads videos, the videos should show and be paginated in 
sections of 5

[x] The videos should give some meta data such as length, format, name of 
video, etc.

[x] Unit and integration tests should be created


### Notes

* Please think about design. Applications are also about the user experience
* Please create a public github repo for this project
* Please make as many commits as it makes sense to other developers
* Create a README so someone else can build this web application on another computer from cloning the repo to test it out
* You can use any language but we do prefer it being in ruby or javascript. If it is not in these languages, please note, we will need instructions to get it running starting from what dependencies are needed :)
* Any notes or thoughts while building it are appreciated.
