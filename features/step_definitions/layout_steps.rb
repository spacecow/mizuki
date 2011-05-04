# TEXT -------------------------

Then /^I should see "([^"]*)" as (\w+) flash message$/ do |txt,cat|
  Then %(I should see "#{txt}" within "div#flash_#{cat}")
end

Then /^I should see "([^"]*)" as title$/ do |txt|
  Then %(I should see "#{txt}" within "h1")
end

Then /^I should see "([^"]*)" within the "([^"]*)" section$/ do |txt,div|
  Then %(I should see "#{txt}" within "div##{underscore div}")
end
Then /^I should not see "([^"]*)" within the "([^"]*)" section$/ do |txt,div|
  Then %(I should not see "#{txt}" within "div##{underscore div}")
end

# AND --------------------------

Then /^I should see "([^"]*)" but no "([^"]*)" within the "([^"]*)" section$/ do |txt1,txt2,div|
  Then %(I should see "#{txt1}" within the "#{div}" section)
  But %(I should not see "#{txt2}" within the "#{div}" section)
end

Then /^I should see "([^"]*)" and "([^"]*)" within the "([^"]*)" section$/ do |txt1,txt2,div|
  Then %(I should see "#{txt1}" within the "#{div}" section)
  And %(I should see "#{txt2}" within the "#{div}" section)
end

# EXISTENCE --------------------

Then /^I should see no links at the bottom of the page$/ do
  page.should have_no_css("div#bottom_links a")
end

Then /^I should see no "([^"]*)" section$/ do |div|
  page.should have_no_css("div##{div}")
end

Then /^I should see (?:a|an) "([^"]*)" section$/ do |div|
  page.should have_css("div##{div}")
end


# LINKS -----------------------

Then /^I should see a "([^"]*)" link$/ do |lnk|
  page.should have_css("a", :text => lnk)
end

Then /^I should see a "([^"]*)" image link$/ do |lnk|
  page.should have_css("a img", :alt => lnk)
end
Then /^I should see no "([^"]*)" image link$/ do |lnk|
  page.should have_no_css("a img", :alt => lnk)
end

Then /^I should see links "([^"]*)" at the (\w+) of the page$/ do |lnks,pos|
  all("div##{pos}_links a").map(&:text).join(", ").should eq lnks
end

When /^I follow "([^"]*)" at the bottom of the page$/ do |lnk|
  When %(I follow "#{lnk}" within the "bottom links" section)
end

When /^I follow "([^"]*)" within the "([^"]*)" section$/ do |lnk,div|
  When %(I follow "#{lnk}" within "div##{underscore(div)}")
end

When /^I click the image "([^"]*)"$/ do |file|
  find(:xpath, "//a/img[@alt='#{file}']/..").click
end
