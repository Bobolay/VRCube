class CreateAccordionSlides < ActiveRecord::Migration
  def up
    create_table :accordion_slides do |t|
      t.boolean :published
      t.integer :sorting_position
      t.string :label
      t.string :title
      t.text :short_description
      t.attachment :image

      t.timestamps null: false
    end

    AccordionSlide.create_translation_table(:label, :title, :short_description)
  end

  def down
    AccordionSlide.drop_translation_table!

    drop_table :accordion_slides
  end
end
