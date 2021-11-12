FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { Task.state_machine.initial_state(0).name }
    expired_at
  end
end
