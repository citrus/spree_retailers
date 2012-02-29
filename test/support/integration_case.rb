require "capybara/rails"

class ActiveSupport::IntegrationCase < ActionController::TestCase
  
  include Capybara::DSL
  
  Capybara.default_driver = :selenium
  
  self.use_transactional_fixtures = false

  # spree url helpers
  def spree
    Spree::Core::Engine.routes.url_helpers
  end

  # Checks for missing translations after each test
  teardown do
    source ||= ""
    unless source.blank?
      matches = source.match(/translation[\s-]+missing[^"]*/) || []
      assert_equal 0, matches.length, "Translation Missing! - #{matches[0]}"
    end
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  
  
  # An assertion for ensuring content has made it to the page.
  #    
  #    assert_seen "Site Title"
  #    assert_seen "Peanut Butter Jelly Time", :within => ".post-title h1"
  #      
  def assert_seen(text, opts={})
    if opts[:within]
      within(opts[:within]) do
        assert has_content?(text), "Expected to see `#{text}` in #{opts[:within]}."
      end
    else
      assert has_content?(text), "Expected to see #{text.inspect}"
    end
  end
  
  # Asserts the proper flash message
  #    
  #    assert_flash "Post was successfully saved!"
  #    assert_flash "Oh No, bad things happened!", :error
  #
  def assert_flash(text, key = :notice)
    assert_seen text, :within => ".flash.#{key}"
  end
  
  # Asserts the proper browser title
  #    
  #    assert_title "My Site - Is super cool"
  #
  def assert_title(title)
    assert_seen title, :within => "head title"
  end
  
  # Asserts meta tags have proper content
  #    
  #    assert_meta :description, "So let me tell you about this one time..."
  #    assert_meta :keywords, "seo, is, fun, jk."
  #
  def assert_meta(tag, text)
    tag = find(:xpath, "//head/meta[@name='#{tag.to_s}']")
    assert_equal text, tag.native.attribute("content")
  end
    
end
