require 'rfg_api_test'

class IOSTest < RFGAPITest
  def test_basic
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          ios: {}
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
EOT
    )
    
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        files_location: {
          type: :path,
          path: "/path/to/icons"
        },
        favicon_design: {
          ios: {}
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/path/to/icons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/path/to/icons/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/path/to/icons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="/path/to/icons/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="/path/to/icons/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/path/to/icons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/path/to/icons/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="/path/to/icons/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/path/to/icons/apple-touch-icon-180x180.png">
EOT
    )
  end
  
  def test_specific_small_master_picture_used_as_is
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          ios: {
            picture_aspect: :no_change,
            master_picture: {
              type: :inline,
              content: "#{to_base64('resources/master_1_120x120.png')}"
            }
          }
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
EOT
    )
  end
  
  def test_background_and_color
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          ios: {
            picture_aspect: :background_and_margin,
            margin: '15%',
            background_color: '#97ab43'
          }
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
EOT
    )
  end
  
  def test_startup_image_default
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          ios: {
            picture_aspect: :background_and_margin,
            margin: '15%',
            background_color: '#97ab43',
            startup_image: {}
          }
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
<link href="/apple-touch-startup-image-1536x2008.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-2048x1496.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-768x1004.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-1024x748.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-640x1096.png" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)\" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-640x920.png" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 2)\" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-320x460.png" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 1)\" rel="apple-touch-startup-image">
EOT
    )
  end
  
  def test_startup_image_specific_settings
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          ios: {
            picture_aspect: :background_and_margin,
            margin: '15%',
            background_color: '#97ab43',
            startup_image: {
              background_color: '#56abcd',
              master_picture: {
                type: :inline,
                content: to_base64("resources/master_svg.svg")
              }
            }
          }
        }
      }
    }, expected_dir_path, <<EOT
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
<link href="/apple-touch-startup-image-1536x2008.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-2048x1496.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-768x1004.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-1024x748.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-640x1096.png" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)\" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-640x920.png" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 2)\" rel="apple-touch-startup-image">
<link href="/apple-touch-startup-image-320x460.png" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 1)\" rel="apple-touch-startup-image">
EOT
    )
  end
end
