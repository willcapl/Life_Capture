class SubUser < ApplicationRecord
  # has_many :responses, through: :questions, dependent: :destroy
  belongs_to :user
  has_many :questions, dependent: :destroy
  validates :name, :relationship_to_user, :dob, :childhood_location,
    :post_education, :birthplace, :career, :adult_life_location,
    :hobbies, :life_after_retirement, presence: true

    def content
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
        model: "gpt-4",
        messages: [{ role: "user", content: "Don't list the questions by number, just type | between each one. Your role is to engage elderly individuals in meaningful conversations by asking them a series of 14 questions. These questions will range from their childhood memories to their vocational challenges and family life. Only give the questions as output. These are the user responses, the user's name is #{self.name}, they are the  #{self.relationship_to_user}, they were born on #{self.dob}, they spent their childhood in #{self.childhood_location}, they did #{self.post_education} after their education, they were born in #{self.birthplace}, Their career was: #{self.career}, They spent their adult life in #{self.adult_life_location}, their favourite hobbies or passions are #{self.hobbies}, After retirement they #{self.life_after_retirement}. You should use any information provided to tailor these questions, such as significant historical events relevant to their lifetime or personal milestones.The final question should always be 'If you could talk to your 25 year old self what would you tell them?'. Don't list the questions by number, just type | between each one. Don't list the questions by number, just type | between each one.}"}]
      })
      questions = chaptgpt_response["choices"][0]["message"]["content"]
      questions_array = questions.split("|")
      questions_array.each do |title|
        question = Question.new(title: title)
        question.sub_user = self
        question.save!
      end
    end

end
