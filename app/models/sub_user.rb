class SubUser < ApplicationRecord
  # has_many :responses, through: :questions, dependent: :destroy
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :playlists
  has_one_attached :photo
  # validates :name, :relationship_to_user, :dob, :childhood_location,
  #   :post_education, :birthplace, :career, :adult_life_location,
  #   :hobbies, :life_after_retirement, presence: true

  def content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4",
      messages: [{ role: "user", content: "Don't list the questions by number, just type | between each one. Your role
        is to engage elderly individuals in meaningful conversations by asking them a series of 14 questions. These questions
        will range from their childhood memories to their vocational challenges and family life. Only give the questions as output.
        These are the user responses, the user's name is #{self.name}, they were born on #{self.dob}, they spent their childhood
        in #{self.childhood_location}, they were primarilary educated at #{self.education}, their career was
        #{self.career}, they spent their adult life in #{self.adult_life_location}, their favourite hobbies or passions are #{self.hobbies}. Don't list the questions by number, just type | between each one.}. Also insert questions about their first job and their parents. Make the questions highly specific and ask
        about friends."}]
    })
    questions = chaptgpt_response["choices"][0]["message"]["content"]
    questions_array = questions.split("|")
    questions_array.each_with_index do |title, index|
      date = Date.today
      time = (index / 2).floor
      date += time.weeks
      question = Question.new(title: title, answer_date: date)
      question.sub_user = self
      question.save!
    end
  end
end
