class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :requester, index: true
      t.references :requested, index: true

      t.timestamps
    end
  end
end
