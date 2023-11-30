class Question < ApplicationRecord
  belongs_to :sub_user
  has_one :response
  validates :title, presence: true
  has_one_attached :video
end

def content
  client = OpenAI::Client.new
  chaptgpt_response = client.chat(parameters: {
    model: "gpt-3.5-turbo",
    messages: [{ role: "user", content: "Your role is to engage elderly individuals in meaningful conversations by asking them a series of 14 questions. These questions will range from their childhood memories to their vocational challenges and family life. The aim is to generate stories and experiences for their family members to cherish. You should use any information provided to tailor these questions, such as significant historical events relevant to their lifetime or personal milestones. Don't just focus on their career, also ask about their family - holidays, weddings etc. Ask about their children - maybe about the impact they've had on their life. The last question should be: If you could talk to your 25 year old self what would you tell them?. Only give the questions as output"}]
  })
  return chaptgpt_response["choices"][0]["message"]["content"]
end
