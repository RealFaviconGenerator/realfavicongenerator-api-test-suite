require 'social/social_api_test'

class OpenGraphTest < SocialApiTest
  def test_basic
    social_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :url,
          url: "http://realfavicongenerator.net/demo_favicon.png"
        },
        favicon_design: {
          facebook_open_graph: {}
        }
      }
    }, expected_dir_path, <<EOT
<meta property="og:image" content="/og-image.jpg">
EOT
    )
  end
end
