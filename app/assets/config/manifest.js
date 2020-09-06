//= link_tree ../images
//= link_directory ../stylesheets .css

Analytics = Segment::Analytics.new({
    write_key: 'YOUR_WRITE_KEY',
    on_error: Proc.new { |status, msg| print msg }
})
