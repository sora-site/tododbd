class TaskThing
  include ActiveModel::Model
  attr_accessor :task_name,
                :thing_name,
                :start_time,
                :end_time,
                :memo,
                :status_id

  # バリデーション
  with_options presence: true do
    validates :task_name, length: { maximum: 20 }
    validates :thing_name, length: { maximum: 20 }
    validates :start_time
    validates :end_time
    validates :memo, length: { maximum: 50 }
    # Activehashバリデーション（ジャンルの選択が「---」(id = 1)の時は保存できないようにする／各項目想定したidより大きい時は保存できないようにする。）
    validates :status_id, numericality: { other_than: 1, less_than: 5 }
  end

  def save
    tasks = Task.where(project_id: params[:id])
    tasks.each do |task|
      task.update(task_name: task.task_name)

      things = Thing.where(task_id: task.id)
      things.each do |thing|
        thing.update(thing_name: thing.thing_name, start_time: thing.start_time, end_time: thing.end_time, memo: thing.memo,
                     status_id: thing.status_id)
      end
    end
  end

  private

  def task_params
    params.require(:task_thing).permit(:task_name, :thing_name, :start_time, :end_time, :memo,
                                       :status_id, :project_id, :task_id)
  end
end
