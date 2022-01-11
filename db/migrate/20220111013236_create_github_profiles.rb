class CreateGithubProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :github_profiles do |t|
      t.integer :commits
      t.datetime :date

      t.timestamps
    end
  end
end
