## README

### Getting the application up and running
 
* Ruby version 2.2.3 recommended. Rails 4.2 requires at least 1.9.3, and likes v2 best.

* Use ffmpeg transcoding library
* `brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libas`

* `bundle` gems

* rake db:setup

Run the test suite using Rspec:
* `rspec` or `rake`

### Checklist of Features

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

