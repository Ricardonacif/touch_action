require 'rack'
@app = Rack::Builder.new do
  
    use Rack::Static,
    :urls => ["/images", "/js", "/css"],
    :root => "./spec/support/static_website/public"

  map "/" do
    run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      File.open('./spec/support/static_website/public/index.html', File::RDONLY)
    ]
  }
  end

  map "/tap" do
    run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      File.open('./spec/support/static_website/public/tap.html', File::RDONLY)
    ]
  }
  end

  map "/pinch" do
    run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      File.open('./spec/support/static_website/public/pinch.html', File::RDONLY)
    ]
  }
  end  
end.to_app