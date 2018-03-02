

# If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
#
# If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
# The submitted article is not saved in any of the above cases.

 require 'spec_helper'
# feature "If user does not specify TITLE, URL and DESCRIIPTION, show error" do
   # As a form user i want to add TITLE, URL and DESCRIPTION
   # Acceptance Criteria:
# If I do not specify a title, URL, and description, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
#

   scenario 'fill in three arguments and submit form' do
     visit '/articles/new'
     fill_in 'Add a Title:', with: 'The Wire is best show'
     fill_in 'Add a URL:', with: 'http://google.com'
      fill_in 'Add a Description:', with: 'Best show ever on tv.... here is why...'
     click_button 'Submit'
    expect(page).to have_content("The Wire is best show")
    expect(page).to have_content("http://google.com")
   end

   if form has error, the expect page to have includes text (mabye title) of form page
     since you have not left, been redirected
     also expect page to have string for the error string whatever it is
#
#   scenario 'do not supply a first number' do
#     visit '/'
#     fill_in 'Second Number', with: '5'
#     click_button '+'
#
#     expect(page).to have_content("Error! " +
#       "Please supply more than one number")
#   end
#
# end
