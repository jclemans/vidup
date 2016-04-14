require 'spec_helper'

describe Video do
  it { should have_attached_file(:attachment) }
  it { should validate_attachment_presence(:attachment) }
  it { should validate_attachment_content_type(:attachment).
                allowing('video/mp4').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:attachment).
                less_than(20.megabytes) }

  xit "does a thing" do
    stuff = things
    expect(stuff).to eq things
  end

end