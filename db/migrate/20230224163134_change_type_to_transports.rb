class ChangeTypeToTransports < ActiveRecord::Migration[7.0]
  def change
    rename_column :to_transports, :type, :variety
    rename_column :there_transports, :type, :variety
  end
end
