# This migration adds the optional `object_changes` t, in which PaperTrail
# will store the `changes` diff for each update event. See the readme for
# details.
class AddObjectChangesToVersions < ActiveRecord::Migration[6.1]
  # The largest text t available in all supported RDBMS.
  # See `create_versions.rb` for details.
  TEXT_BYTES = 1_073_741_823

  def change
    add_column :versions, :object_changes, :text, limit: TEXT_BYTES
  end
end
