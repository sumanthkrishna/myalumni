class CreateAlumnis < ActiveRecord::Migration
  def self.up
    create_table :alumnis do |t|
      t.integer :user_id
      t.integer :university_id
      t.integer :course_id
      t.integer :year

      t.timestamps
    end
  end

  def self.down
    drop_table :alumnis
  end
end
