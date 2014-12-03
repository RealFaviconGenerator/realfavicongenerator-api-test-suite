require 'rfg_api_test'

class GlobalTest < RFGAPITest
  def test_1
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
            background_color: '#ff0099',
            margin: '10%'
          },
          windows: {
            picture_aspect: :white_silhouette,
            background_color: '#789abc'
          },
          firefox_app: {
            picture_aspect: :circle,
            keep_picture_in_circle: true,
            circle_inner_margin: 1,
            background_color: '#aabbcc',
            manifest: {
              app_name: 'An app',
              app_description: 'This is an app',
              developer_name: 'Me',
              developer_url: 'http://example.com/me'
            }
          },
          android_chrome: {
            picture_aspect: :shadow,
            theme_color: '#99abcd',
            manifest: {
              name: 'Another app',
              display: :standalone,
              orientation: :landscape,
              start_url: 'http://example.com/an_app'
            }
          },
          coast: {
            picture_aspect: :background_and_margin,
              background_color: '#97af12',
              margin: '30%'
          },
          open_graph: {
            picture_aspect: :background_and_margin,
            background_color: '#794613',
            margin: '20%',
            ratio: '1.91:1'
          },
          yandex_browser: {
            background_color: '#ccdd00',
            manifest: {
              show_title: true,
              version: '123.456.789'
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
<meta name="msapplication-TileColor" content="#789abc">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<link rel="manifest" href="/android_chrome_manifest.json">
<meta name="theme-color" content="#99abcd">
<link rel="icon" type="image/png" href="/coast-228x228.png" sizes="228x228">
<meta property="og:image" content="/open-graph.png">
<link rel="yandex-tableau-widget" href="/yandex-browser-manifest.json">
EOT
    )
  end
  
  def test_1_compressed
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
            background_color: '#ff0099',
            margin: '10%'
          },
          windows: {
            picture_aspect: :white_silhouette,
            background_color: '#789abc'
          },
          firefox_app: {
            picture_aspect: :circle,
            keep_picture_in_circle: true,
            circle_inner_margin: 1,
            background_color: '#aabbcc',
            manifest: {
              app_name: 'An app',
              app_description: 'This is an app',
              developer_name: 'Me',
              developer_url: 'http://example.com/me'
            }
          },
          android_chrome: {
            picture_aspect: :shadow,
            theme_color: '#99abcd',
            manifest: {
              name: 'Another app',
              display: :standalone,
              orientation: :landscape,
              start_url: 'http://example.com/an_app'
            }
          },
          coast: {
            picture_aspect: :background_and_margin,
              background_color: '#97af12',
              margin: '30%'
          },
          open_graph: {
            picture_aspect: :background_and_margin,
            background_color: '#794613',
            margin: '20%',
            ratio: '1.91:1'
          },
          yandex_browser: {
            background_color: '#ccdd00',
            manifest: {
              show_title: true,
              version: '123.456.789'
            }
          }
        },
        settings: {
          compression: 5,
          scaling_algorithm: "Mitchell"
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
<meta name="msapplication-TileColor" content="#789abc">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<link rel="manifest" href="/android_chrome_manifest.json">
<meta name="theme-color" content="#99abcd">
<link rel="icon" type="image/png" href="/coast-228x228.png" sizes="228x228">
<meta property="og:image" content="/open-graph.png">
<link rel="yandex-tableau-widget" href="/yandex-browser-manifest.json">
EOT
    )
  end
  
  def test_svg
    favicon_generation({
      favicon_generation: {
        api_key: "87d5cd739b05c00416c4a19cd14a8bb5632ea563",
        master_picture: {
          type: :inline,
          content: to_base64("resources/master_svg.svg")
        },
        favicon_design: {
          desktop_browser: {},
          ios: {
            picture_aspect: :background_and_margin,
            background_color: '#ff0099',
            margin: '10%'
          },
          windows: {
            picture_aspect: :white_silhouette,
            background_color: '#789abc'
          },
          firefox_app: {
            picture_aspect: :circle,
            keep_picture_in_circle: true,
            circle_inner_margin: 1,
            background_color: '#aabbcc',
            manifest: {
              app_name: 'An app',
              app_description: 'This is an app',
              developer_name: 'Me',
              developer_url: 'http://example.com/me'
            }
          },
          android_chrome: {
            picture_aspect: :shadow,
            theme_color: '#99abcd',
            manifest: {
              name: 'Another app',
              display: :standalone,
              orientation: :landscape,
              start_url: 'http://example.com/an_app'
            }
          },
          coast: {
            picture_aspect: :background_and_margin,
              background_color: '#97af12',
              margin: '30%'
          },
          open_graph: {
            picture_aspect: :background_and_margin,
            background_color: '#794613',
            margin: '20%',
            ratio: '1.91:1'
          },
          yandex_browser: {
            background_color: '#ccdd00',
            manifest: {
              show_title: true,
              version: '123.456.789'
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
<link rel="icon" type="image/png" href="/favicon-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="/favicon-160x160.png" sizes="160x160">
<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<meta name="msapplication-TileColor" content="#789abc">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<link rel="manifest" href="/android_chrome_manifest.json">
<meta name="theme-color" content="#99abcd">
<link rel="icon" type="image/png" href="/coast-228x228.png" sizes="228x228">
<meta property="og:image" content="/open-graph.png">
<link rel="yandex-tableau-widget" href="/yandex-browser-manifest.json">
EOT
    )
  end
end
