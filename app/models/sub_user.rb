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
        model: "gpt-4-1106-preview",
        messages: [{ role: "user", content: "Don't list the questions by number, just type | between each one. Your role is to engage elderly individuals in meaningful conversations by asking them a series of 14 questions. These questions will range from their childhood memories to their vocational challenges and family life. Only give the questions as output. These are the user responses #{self.name}, #{self.relationship_to_user}, #{self.dob}, #{self.childhood_location}, #{self.post_education}, #{self.birthplace}, #{self.career}, #{self.adult_life_location}, #{self.hobbies}, #{self.life_after_retirement}. Don't list the questions by number, just type | between each one}"}]
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
