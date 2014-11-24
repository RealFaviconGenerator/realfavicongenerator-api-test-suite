require 'minitest/autorun'
require 'rest_client'
require 'json'
require 'open-uri'
require 'zip'
require 'RMagick'

class RFGAPITest < MiniTest::Unit::TestCase
  include Magick

  def favicon_generation(request, expected_file_dir, expected_html)
    response = RestClient.post("http://realfavicongenerator.net/api/favicon", request.to_json, content_type: :json)
      
    response = JSON.parse  response.body
    
    assert_equal 'success', response['favicon_generation_result']['result']['status']
    assert_equal expected_html, response['favicon_generation_result']['favicon']['html_code'] + "\n"
    
    Dir.mktmpdir 'rfg_test_suite'  do |dir|
      download_package response['favicon_generation_result']['favicon']['package_url'], dir
      assert_directory_equal expected_file_dir, dir, "Stored in #{dir}"
      puts "TODO: check package"
    end
    
  end
  
  def assert_directory_equal(expected_dir, observed_dir, msg = nil)
    observed_files = files_list(observed_dir).sort
    assert_equal files_list(expected_dir).sort, observed_files, msg
    observed_files.each do |file|
      assert_file_equal "#{expected_dir}/#{file}", "#{observed_dir}/#{file}"
    end
  end
  
  def assert_file_equal(expected_file, observed_file)
    case File.extname(observed_file)
    when '.ico'
      Dir.mktmpdir 'rfg_test_suite_ico_exp'  do |out_exp|
        Dir.mktmpdir 'rfg_test_suite_ico_OBS'  do |out_obs|
          extract_ico(expected_file, out_exp)
          extract_ico(observed_file, out_obs)
          assert_directory_equal(out_exp, out_obs)
        end
      end
    when '.png'
      obs = ImageList.new(observed_file).minify
      exp = ImageList.new(expected_file).minify
      assert_equal exp.format, obs.format
      assert_equal [exp.columns, exp.rows], [obs.columns, obs.rows]
      assert_equal get_image_pixel(exp), get_image_pixel(obs)
    else
      assert_equal File.read(expected_file), File.read(observed_file)
    end
  end
  
  def extract_ico(ico_file, output_dir)
    system("icotool -x -o #{output_dir} #{ico_file} 2>/dev/null")
    
    Dir.foreach(output_dir) do |item|
      next if item == '.' or item == '..'
      if item =~ /.*(\d+x\d+)x\d+\.png/
        File.rename("#{output_dir}/#{item}", "#{output_dir}/#{$1}.png")
      end
    end
  end
  
  def get_image_pixel(image)
    image.get_pixels(0, 0, image.columns, image.rows).map {|p| p.to_color}
  end
  
  def files_list(directory, base_dir = nil)
    list = []
    Dir.foreach(directory) do |item|
      next if item == '.' or item == '..'
      if File.directory? "#{directory}/#{item}"
        list += files_list("#{directory}/#{item}", ((base_dir == nil) ? item : "#{base_dir}/#{item}"))
      else
        list << ((base_dir == nil) ? item : "#{base_dir}/#{item}")
      end
    end
    list
  end
  
  def download_package(package_url, output_dir)
    file = Tempfile.new('fav_package')
    file.close
    download_file package_url, file.path
    extract_zip file.path(), output_dir
  end
  
  def download_file(url, local_path)
    File.open(local_path, "wb") do |saved_file|
      open(url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end
  
  def extract_zip(zip_path, output_dir)
    Zip::ZipFile.open zip_path do |zip_file|
      zip_file.each do |f|
        f_path=File.join  output_dir, f.name
        FileUtils.mkdir_p  File.dirname(f_path)
        zip_file.extract(f, f_path) unless File.exist? f_path
      end
    end
  end
  
  def expected_dir_path
    # eg. "test_some_stuff"
    method = (caller[0] =~ /`([^']*)'/ and $1)
    # eg. "some_test"
    file = (caller[0] =~ /([^\/:]*).rb:/ and $1)
    # eg. expected_files/some_test/test_some_stuff
    dir = 'expected_files/' + file + '/' + method
  end
end
