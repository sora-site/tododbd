class TaskStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '完了' },
    { id: 3, name: '実施中' }, { id: 4, name: '未着手' }, { id: 5, name: 'スタック（実施不可）' }
  ]

  include ActiveHash::Associations
  has_many :things
end
