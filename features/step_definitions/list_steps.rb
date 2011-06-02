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

Then /^I should not see "([^"]*)" within the "([^"]*)" listing$/ do |txt,lst|
  Then %(I should not see "#{txt}" within "ul##{underscore lst}")
end

def list_no(lst=nil,order)
  if lst.nil?
    "ul li:nth-child(#{digit order})"
  else
    "ul##{underscore(lst)} li:nth-child(#{digit order})"
  end
end
  
