require 'rfg_api_test'

class DesktopBrowserTest < RFGAPITest
  def test_basic
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          desktop_browser: {}
        }
      }
    }, expected_dir_path, <<EOT
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
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
          desktop_browser: {}
        }
      }
    }, expected_dir_path, <<EOT
<link rel="icon" type="image/png" href="/path/to/icons/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/path/to/icons/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/path/to/icons/favicon-16x16.png" sizes="16x16">
<link rel="shortcut icon" href="/path/to/icons/favicon.ico">
EOT
    )
  end
  
  def test_specific_small_master_picture
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          desktop_browser: {
            master_picture: {
              type: :inline,
              content: "#{to_base64('resources/master_1_120x120.png')}"
            }
          }
        }
      }
    }, expected_dir_path, <<EOT
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
EOT
    )
  end
end
