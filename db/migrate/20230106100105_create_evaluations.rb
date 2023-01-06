class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      
      t.float :evaluation

      t.timestamps
    end
  end
end
