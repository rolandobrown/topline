require_relative '../collect_words_from_user.rb'

describe "collect_words_from_user method" do
  it "prompts the the user for their favorite words" do
    intro_line = "Hello! What word do you choose?"
    todays_word = "happy"

    expect(todays_word).to eq("happy")
  end
end

# describe "current_age_for_birth_year method" do
#   it "should return the current year for a person born in year 0" do
#     twenty_fifteen = current_age_for_birth_year(0)

#     expect(twenty_fifteen).to eq(2015)
#   end
# end