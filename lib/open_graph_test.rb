require 'rfg_api_test'

class OpenGraphTest < RFGAPITest
  def test_basic
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          open_graph: {}
        }
      }
    }, expected_dir_path, <<EOT
<meta property="og:image" content="/open-graph.png">
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
          open_graph: {}
        }
      }
    }, expected_dir_path, <<EOT
<meta property="og:image" content="/path/to/icons/open-graph.png">
EOT
    )
  end
  
  def test_square
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          open_graph: {
            picture_aspect: :background_and_margin,
            ratio: :square,
            background_color: '#009aff',
            margin: '25%'
          }
        }
      }
    }, expected_dir_path, <<EOT
<meta property="og:image" content="/open-graph.png">
EOT
    )
  end
  
  def test_191_1
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          open_graph: {
            picture_aspect: :background_and_margin,
            ratio: '1.91:1',
            background_color: '#ff5500',
            margin: '5%'
          }
        }
      }
    }, expected_dir_path, <<EOT
<meta property="og:image" content="/open-graph.png">
EOT
    )
  end
end
