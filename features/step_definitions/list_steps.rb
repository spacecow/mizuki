# TEXT LINK --------------------

Then /^I should see (?:a|an) "([^"]*)" link within the (\w+) "([^"]*)" listing$/ do |lnk,order,id|
  page.should have_css("#{list_no(id,order)} a", :text => lnk)
end
Then /^I should see no "([^"]*)" link within the (\w+) "([^"]*)" listing$/ do |lnk,order,id|
  page.should have_no_css("#{list_no(id,order)} a", :text => lnk)
end


# TEXT --------------------------

Then /^I should see "([^"]*)" within the (\w+) listing$/ do |txt,order|
  with_scope(list_no order) do
    page.should have_content(txt)
  end
end
Then /^I should see "([^"]*)" within the (\w+) "([^"]*)" listing$/ do |txt,order,id|
  with_scope(list_no(id,order)) do
    page.should have_content(txt)
  end
end

Then /^I should not see "([^"]*)" within the (.+) listing$/ do |txt,lst|
  Then %(I should not see "#{txt}" within "ul##{underscore lst}")
end

# EXISTENCE ----------------------

Then /^I should see a (\w+) (\w+) listing$/ do |order,lst|
  page.should have_css(list_no(lst,order))
end
Then /^I should see no (\w+) (\w+) listing$/ do |order,lst|
  page.should have_no_css(list_no(lst,order))
end


# AND ----------------------------

Then /^I should see "([^"]*)" and "([^"]*)" within the (\w+) "([^"]*)" listing$/ do |txt1,txt2,order,lst|
  Then %(I should see "#{txt1}" within the #{order} "#{lst}" listing)
  And %(I should see "#{txt2}" within the #{order} "#{lst}" listing)
end

Then /^I should see no "([^"]*)" nor "([^"]*)" link within the (\w+) "([^"]*)" listing$/ do |txt1,txt2,order,id|
  Then %(I should see no "#{txt1}" link within the #{order} "#{id}" listing)
  And %(I should see no "#{txt2}" link within the #{order} "#{id}" listing)
end


# LINKS --------------------------

When /^I follow "([^"]*)" within the (\w+) "([^"]*)" listing$/ do |lnk,order,lst|
  When %(I follow "#{lnk}" within "#{list_no(lst,order)}")
end

def list_no(lst=nil,order)
  if lst.nil?
    "ul li:nth-child(#{digit order})"
  else
    "ul##{underscore(lst)} li:nth-child(#{digit order})"
  end
end
