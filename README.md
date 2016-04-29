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

### Development notes

These are just some personal notes of my decision making process and reflections on some of the challenges I ran into during development.

#### Metadata challenges

Getting the metadata from an uploaded video was tricky because the documentation for the 'paperclip-av-transcoder' gem was poorly written. After much searching I contacted the creator of the gem to get clarification. After I got it working I forked the gem, updated the README and submitted a PR so that others would have an easier time using it going forward (https://github.com/ruby-av/paperclip-av-transcoder/pull/43). Hooray for open source!

#### Paperclip for File Uploads

I chose to use the paperclip gem to handle file uploading because it is super simple to get set up, and works great. I have used it many times before, so I knew I wasn't going to get hung up implementing it. Thoughtbot does good work, and paperclip is well supported/documented. 

Carrierwave is another good option, but I have less familiarity with it. It seems more versatile, so might make a better choice for an app where file upload feature complexity is expected to increase. Carrierwave looks to be more customizable and is said to have better file processing and caching capabilities.

#### Pagination

The 'kaminari' gem was chosen for adding pagination functionality. This was probably the quickest and most painless feature to implement in this project. [I love it when a plan comes together.](https://www.youtube.com/watch?v=wyz_2DEah4o)

#### Progress Bar

This was one of those features that seems like it should be easy when you've never done it before. Maybe this is why spinners are so much more popular in web dev these days. I decided to go with plain old JQuery with a little bit of AJAX to kick off the video upload and update the index view. I used a gem called 'jquery-fileupload-rails' and tried to use the most basic implementation possible. In retrospec it may have been quicker and easier to just use more of the default plugin code instead of hand writing a good chunk of JQuery myself. If this was a full fledged app that I would be working on longer term, I would probably have decided to build out the front end behavior using a framework like Angular, React, or Polymer. It seemed like overkill for a small demo project.

I found it was especially challenging to synchronize the animation of the progress bar and the data for the percentage complete and time remaining. Uploading a file to the app in local development completes very quickly, so it's a difficult process to test and debug. It would be helpful to hook the app up to cloud storage to get a better sense of how it behaves in a more realistic context.
