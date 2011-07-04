class CreateAgreements < ActiveRecord::Migration
  def self.up
    create_table :agreements do |t|
      t.string :version
      t.string :projectname
      t.string :submission
      t.string :method
      t.string :nonowner
      t.string :grant
      t.integer :option
      t.string :outbound
      t.string :media

      t.timestamps
    end
  end

  def self.down
    drop_table :agreements
  end
end
