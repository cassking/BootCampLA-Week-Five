require "spec_helper"

feature "User views all projects" do
  Project.create({
          name: "Project about projects",
          description: "so much  collaboration"
        })
  scenario 'user views all projects on index' do
    visit '/projects'
    expect(page).to have_content("Project about projects")
  end

end

# scenario "view list of TV shows" do
#     # First create some sample TV shows
#     game_of_thrones = TelevisionShow.create!({
#         title: "Game of Thrones", network: "HBO",
#         starting_year: 2011, genre: "Fantasy"
#       })
#
#     married_with_children = TelevisionShow.create!({
#         title: "Married... with Children", network: "Fox",
#         starting_year: 1987, ending_year: 1997,
#         genre: "Comedy"
#       })
#
#     # The user visits the index page
#     visit "/television_shows"
#
#     # And should see both TV shows listed (just the title and network)
#     expect(page).to have_content("Game of Thrones (HBO)")
#     expect(page).to have_content("Married... with Children (Fox)")
#   end
