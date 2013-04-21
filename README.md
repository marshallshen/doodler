# Doodler
Doodler is a Ruby Gem for Image Processing, it tries to redraw pictures
in human-like fashion

## Doodler 1.1 updates

- Speed up image recreating
- Improve test coverage
- Diversify image processing methods (bubblize, cubify, textify)

## Installation

Add this line to your application's Gemfile:

    gem 'doodler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doodler

## Usage
```ruby
IMAGE_PATH="image/baseline/baseline_1.png" rake draw

> Doodler starts drawing! ...
> Doodle completes drawing! Image is saved in image/render/output.png
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
